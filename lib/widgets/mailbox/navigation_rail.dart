import 'package:flutter/material.dart';
import 'package:mailbox/widgets/mailbox/destination.dart';

class MailNavigationRail extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onDestinationSelected;
  final List<MailboxDestination> destinations;

  const MailNavigationRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: destinations
          .map(
            (d) => NavigationRailDestination(
              icon: Icon(d.icon),
              selectedIcon: Icon(d.selectedIcon),
              label: Text(d.label),
            ),
          )
          .toList(),
    );
  }
}
