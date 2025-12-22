import 'package:flutter/material.dart';

class MailNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onDestinationSelected;

  const MailNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
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
