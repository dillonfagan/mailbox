import 'package:flutter/material.dart';

class MailNavigationRail extends StatelessWidget {
  const MailNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      selectedIndex: 0,
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.inbox_outlined),
          selectedIcon: Icon(Icons.inbox),
          label: Text('Inbox'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.edit_outlined),
          selectedIcon: Icon(Icons.edit),
          label: Text('Sent'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.drafts_outlined),
          selectedIcon: Icon(Icons.drafts),
          label: Text('Drafts'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.delete_outlined),
          selectedIcon: Icon(Icons.delete),
          label: Text('Trash'),
        ),
      ],
    );
  }
}
