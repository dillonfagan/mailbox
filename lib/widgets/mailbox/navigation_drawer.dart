import 'package:flutter/material.dart';
import 'package:mailbox/utils/spacing.dart';

class MailNavigationDrawer extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onDestinationSelected;

  const MailNavigationDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        onDestinationSelected(index);
        Scaffold.of(context).closeDrawer();
      },
      header: Builder(
        builder: (context) {
          final colorScheme = Theme.of(context).colorScheme;
          return Container(
            color: colorScheme.primaryContainer,
            margin: const EdgeInsets.only(bottom: Spacing.large),
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
        NavigationDrawerDestination(
          icon: Icon(Icons.inbox_outlined),
          label: Text('Inbox'),
          selectedIcon: Icon(Icons.inbox),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.send_outlined),
          label: Text('Sent'),
          selectedIcon: Icon(Icons.send),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.drafts_outlined),
          label: Text('Drafts'),
          selectedIcon: Icon(Icons.drafts),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.delete_outlined),
          label: Text('Trash'),
          selectedIcon: Icon(Icons.delete),
        ),
      ],
    );
  }
}
