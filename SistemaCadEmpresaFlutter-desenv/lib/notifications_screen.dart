import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Lista de notificações
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'New Message',
      subtitle: 'You have a new message from John.',
      read: false,
    ),
    NotificationItem(
      title: 'Download Complete',
      subtitle: 'Your file has been downloaded.',
      read: false,
    ),
    NotificationItem(
      title: 'Friend Online',
      subtitle: 'Anna has just come online.',
      read: false,
    ),
    NotificationItem(
      title: 'Event Reminder',
      subtitle: 'Don\'t forget about the meeting at 3 PM.',
      read: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.amber, // Cor de fundo da barra de navegação
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            NotificationItem item = notifications[index];
            return Card(
              color: item.read ? Colors.green : Colors.amber, // Cor de fundo do card
              child: ListTile(
                leading: Icon(Icons.message),
                title: Text(item.title),
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

  NotificationItem({required this.title, required this.subtitle, required this.read});
}

void main() {
  runApp(MaterialApp(
    home: NotificationsScreen(),
  ));
}
