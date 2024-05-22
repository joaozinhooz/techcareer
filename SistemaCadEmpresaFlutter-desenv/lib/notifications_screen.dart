import 'package:flutter/material.dart';
import 'package:sistema_cadastro_empresa/messages_screen.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Lista de notificações
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Nova Mensagem',
      subtitle: 'Tech Wave > Alice: Olá, pessoal!',
      read: false,
    ),
    NotificationItem(
      title: 'Tech Career',
      subtitle: 'Temos um suporte automático para lhe ajudar!',
      read: false,
      verified: true, // Adicionando o selo de verificado
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
        backgroundColor: Colors.amber, // Cor de fundo da barra de navegação
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            NotificationItem item = notifications[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessagesScreen()),
                );
              },
              child: Card(
                color: item.read ? Colors.green : Colors.amber, // Cor de fundo do card
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Row(
                    children: [
                      Text(item.title),
                      if (item.verified) // Adicionando o selo de verificado
                        Icon(Icons.verified, color: Colors.blue),
                    ],
                  ),
                  subtitle: Text(item.subtitle),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0), // Borda arredondada
                    ),
                    child: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green), // Ícone de marcação de leitura
                              SizedBox(width: 8), // Espaçamento entre o ícone e o texto
                              Text('Marcar como lida'),
                            ],
                          ),
                          value: 'mark_as_read',
                        ),
                        PopupMenuItem(
                          child: Row(
                            children: [
                              Icon(Icons.delete, color: Colors.red), // Ícone de lixeira em vermelho
                              SizedBox(width: 8), // Espaçamento entre o ícone e o texto
                              Text('Excluir', style: TextStyle(color: Colors.red)), // Texto em vermelho
                            ],
                          ),
                          value: 'delete',
                        ),
                      ],
                      offset: Offset(0, 30), // Desloca o menu suspenso para baixo
                      onSelected: (value) {
                        if (value == 'mark_as_read') {
                          setState(() {
                            // Marca a notificação como lida
                            item.read = true;
                          });
                        } else if (value == 'delete') {
                          setState(() {
                            // Remove a notificação da lista
                            notifications.removeAt(index);
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Classe para representar cada item de notificação
class NotificationItem {
  final String title;
  final String subtitle;
  bool read;
  bool verified; // Adicionando a propriedade de verificação

  NotificationItem({required this.title, required this.subtitle, required this.read, this.verified = false});
}

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
  ));
}
