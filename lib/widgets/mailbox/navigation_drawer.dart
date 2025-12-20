import 'package:flutter/material.dart';
import 'package:mailbox/utils/spacing.dart';

class MailNavigationDrawer extends StatelessWidget {
  const MailNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      header: Builder(
        builder: (context) {
          final colorScheme = Theme.of(context).colorScheme;
          return Container(
            color: colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(Spacing.large),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundColor: colorScheme.onPrimaryContainer,
                    foregroundColor: colorScheme.primaryContainer,
                    child: Text('A'),
                  ),
                  SizedBox(width: Spacing.large),
                  Text(
                    'Your Name',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      children: [
        ListTile(leading: Icon(Icons.inbox), title: Text('Inbox')),
        ListTile(leading: Icon(Icons.send), title: Text('Sent')),
        ListTile(leading: Icon(Icons.drafts), title: Text('Drafts')),
        ListTile(leading: Icon(Icons.delete), title: Text('Trash')),
      ],
    );
  }
}
