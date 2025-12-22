import 'package:flutter/material.dart';
import 'package:mailbox/utils/spacing.dart';
import 'package:mailbox/widgets/mailbox/destination.dart';

class MailNavigationDrawer extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onDestinationSelected;
  final List<MailboxDestination> destinations;

  const MailNavigationDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
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
      children: destinations
          .map(
            (d) => NavigationDrawerDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon),
              label: Text(d.label),
            ),
          )
          .toList(),
    );
  }
}
