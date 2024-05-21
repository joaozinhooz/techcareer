import 'package:flutter/material.dart';

// Modelo de dados para representar uma mensagem
class Message {
  final String senderName; // Nome do remetente da mensagem
  final String messageText; // Texto da mensagem
  final String senderImage; // URL da foto do perfil do remetente

  Message({
    required this.senderName,
    required this.messageText,
    required this.senderImage,
  });
}

// Modelo de dados para representar um grupo de mensagens
class MessageGroup {
  final String groupName;
  final String groupImage; // URL da foto do grupo
  final List<Message> messages;
  final bool verified; // Indica se o grupo é verificado ou não
  final bool isSupport; // Indica se é um grupo de suporte

  MessageGroup({
    required this.groupName,
    required this.groupImage,
    required this.messages,
    this.verified = false,
    this.isSupport = false,
  });
}

class MessagesScreen extends StatelessWidget {
  // Lista de grupos de mensagens
  final List<MessageGroup> messageGroups = [
    MessageGroup(
      groupName: 'Grupo 1',
      groupImage: 'https://via.placeholder.com/150', // Adicione a URL da foto do grupo
      verified: true, // Grupo verificado
      messages: [],
    ),
    MessageGroup(
      groupName: 'Suporte',
      groupImage: 'https://via.placeholder.com/150', // Adicione a URL da foto do grupo
      verified: true, // Grupo verificado
      isSupport: true, // Grupo de suporte
      messages: [],
    ),
    // Adicione mais grupos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'), // Título da barra de navegação
      ),
      body: ListView.builder(
        itemCount: messageGroups.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Text(
                  messageGroups[index].groupName,
                  style: TextStyle(fontWeight: FontWeight.bold), // Nome do grupo em negrito
                ),
                if (messageGroups[index].verified)
                  Icon(Icons.verified, color: Colors.blue), // Ícone de verificado se o grupo for verificado
              ],
            ),
            subtitle: messageGroups[index].messages.isNotEmpty
                ? Text(messageGroups[index].messages.first.messageText) // Exibição da primeira mensagem do grupo
                : null,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(messageGroups[index].groupImage), // Foto do grupo
            ),
            onTap: () {
              // Navega para a tela de chat ao clicar em um grupo de mensagens
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    groupName: messageGroups[index].groupName,
                    groupImage: messageGroups[index].groupImage,
                    messages: messageGroups[index].messages,
                    verified: messageGroups[index].verified,
                    isSupport: messageGroups[index].isSupport,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Tela de chat
class ChatScreen extends StatefulWidget {
  final String groupName; // Nome do grupo
  final String groupImage; // URL da foto do grupo
  final List<Message> messages; // Lista de mensagens para o chat
  final bool verified; // Indica se o grupo é verificado ou não
  final bool isSupport; // Indica se é um grupo de suporte

  ChatScreen({
    required this.groupName,
    required this.groupImage,
    required this.messages,
    required this.verified,
    required this.isSupport,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> options = [
    'Estou com problema com os cursos',
    'Não consigo acessar meu certificado',
    'Não consigo visualizar as video aulas',
    'Outro'
  ];
  final Map<String, String> supportResponses = {
    'Estou com problema com os cursos': 'Lamentamos que você esteja enfrentando problemas com os cursos. Por favor, tente reiniciar o aplicativo e verifique sua conexão com a internet. Se o problema persistir, entre em contato com nosso suporte técnico para assistência adicional.',
    'Não consigo acessar meu certificado': 'Pedimos desculpas pela inconveniência. Certifique-se de que você concluiu todos os requisitos do curso. Caso já tenha feito isso, tente limpar o cache do aplicativo e reiniciá-lo. Se o problema continuar, entre em contato com nosso suporte técnico.',
    'Não consigo visualizar as video aulas': 'Para limpar o cache do aplicativo, vá para Configurações > Aplicativos > [Seu aplicativo] > Armazenamento > Limpar cache.',
  };
  String? selectedOption;
  bool isOtherSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.groupImage), // Foto do grupo na barra de navegação
            ),
            SizedBox(width: 8), // Espaçamento entre a foto e o texto
            Text(
              widget.groupName,
              style: TextStyle(fontWeight: FontWeight.bold), // Nome do grupo em negrito
            ),
            if (widget.verified)
              Icon(Icons.verified, color: Colors.blue), // Ícone de verificado se o grupo for verificado
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(widget.messages[index].senderImage),
                  ),
                  title: Text(widget.messages[index].senderName), // Nome do remetente
                  subtitle: Text(widget.messages[index].messageText), // Texto da mensagem
                );
              },
            ),
          ),
          if (widget.isSupport)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: selectedOption,
                          items: options.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          hint: Text('Selecione uma opção'),
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                              isOtherSelected = value == 'Outro';
                            });
                          },
                        ),
                      ),
                      if (!isOtherSelected)
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            if (selectedOption != null) {
                              _sendSupportMessage(selectedOption!);
                              selectedOption = null;
                            }
                          },
                        ),
                    ],
                  ),
                  if (isOtherSelected)
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: 'Descreva seu problema...',
                            ),
                            onSubmitted: (value) {
                              _sendOtherMessage(value);
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            _sendOtherMessage(_messageController.text);
                            _messageController.clear();
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          if (!widget.isSupport)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.0),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Digite uma mensagem...',
                      ),
                      onSubmitted: (value) {
                        _sendMessage(value);
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      _sendMessage(_messageController.text);
                      _messageController.clear(); // Limpa o campo de texto após enviar a mensagem
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    setState(() {
      widget.messages.add(Message(
        senderName: 'Eu',
        messageText: text,
        senderImage: 'https://via.placeholder.com/150',
      ));
      // Se for um grupo de 'Grupo 1', limpa o campo de texto após enviar a mensagem
      if (!widget.isSupport) {
        _messageController.clear();
      }
    });
  }

  void _sendSupportMessage(String option) {
    setState(() {
      widget.messages.add(Message(
        senderName: 'Eu',
        messageText: option,
        senderImage: 'https://via.placeholder.com/150',
      ));
      widget.messages.add(Message(
        senderName: 'Suporte',
        messageText: supportResponses[option]!,
        senderImage: 'https://via.placeholder.com/150',
      ));
    });
  }

  void _sendOtherMessage(String text) {
    setState(() {
      widget.messages.add(Message(
        senderName: 'Eu',
        messageText: text,
        senderImage: 'https://via.placeholder.com/150',
      ));
      widget.messages.add(Message(
        senderName: 'Suporte',
        messageText: 'Recebemos seu problema e estamos analisando. Em breve retornaremos com uma solução.',
        senderImage: 'https://via.placeholder.com/150',
      ));
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: MessagesScreen(),
  ));
}
