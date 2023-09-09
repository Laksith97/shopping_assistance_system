import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
  ];

  Future<void> _refreshNotifications() async {
    // Simulate fetching new notifications from an API or other data source.
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay.

    setState(() {
      // Replace the notifications list with updated data.
      notifications = [
        'Updated Notification 1',
        'Updated Notification 2',
        'Updated Notification 3',
      ];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFFC4593B),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            final notification = notifications[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationDetail(notification),
                  ),
                );
              },
              child: Dismissible(
                key: Key(notification), // Unique key for each notification
                onDismissed: (direction) {
                  setState(() {
                    notifications.removeAt(index);
                  });
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(notification),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NotificationDetail extends StatelessWidget {
  final String notification;

  NotificationDetail(this.notification);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Detail'),
        backgroundColor: Color(0xFF09DE35),
      ),
      body: Center(
        child: Text(notification),
      ),
    );
  }
}
