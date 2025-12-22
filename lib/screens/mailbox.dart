import 'package:flutter/material.dart';
import 'package:mailbox/utils/spacing.dart';
import 'package:mailbox/widgets/compose/compose_view.dart';
import 'package:mailbox/widgets/inbox/inbox_list_view.dart';
import 'package:mailbox/widgets/mailbox/destination.dart';
import 'package:mailbox/widgets/mailbox/navigation_drawer.dart';
import 'package:mailbox/widgets/mailbox/navigation_rail.dart';
import 'package:mailbox/widgets/sent/sent_list_view.dart';
import 'package:mailbox/widgets/shared/menu_button.dart';

class MailboxScreen extends StatefulWidget {
  const MailboxScreen({super.key});

  @override
  State<MailboxScreen> createState() => _MailboxScreenState();
}

class _MailboxScreenState extends State<MailboxScreen> {
  int destinationIndex = 0;

  final destinations = [
    MailboxDestination(
      label: 'Inbox',
      icon: Icons.inbox_outlined,
      selectedIcon: Icons.inbox,
      view: InboxListView(),
    ),
    MailboxDestination(
      label: 'Sent',
      icon: Icons.send_outlined,
      selectedIcon: Icons.send,
      view: SentListView(),
    ),
    MailboxDestination(
      label: 'Drafts',
      icon: Icons.drafts_outlined,
      selectedIcon: Icons.drafts,
      view: Container(),
    ),
    MailboxDestination(
      label: 'Trash',
      icon: Icons.delete_outlined,
      selectedIcon: Icons.delete,
      view: Container(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return buildWideLayout(context);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(destinations[destinationIndex].label),
            leading: MenuButton(),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              CircleAvatar(child: Text('A')),
            ],
            actionsPadding: EdgeInsets.only(right: Spacing.large),
          ),
          drawer: MailNavigationDrawer(
            selectedIndex: destinationIndex,
            onDestinationSelected: (index) {
              setState(() {
                destinationIndex = index;
              });
            },
            destinations: destinations,
          ),
          body: destinations[destinationIndex].view,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => compose(context),
            icon: Icon(Icons.create),
            label: Text('Compose'),
          ),
        );
      },
    );
  }

  Widget buildWideLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destinations[destinationIndex].label),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          CircleAvatar(child: Text('A')),
        ],
        actionsPadding: EdgeInsets.only(right: Spacing.large),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Row(
        children: [
          MailNavigationRail(
            selectedIndex: destinationIndex,
            onDestinationSelected: (index) {
              setState(() {
                destinationIndex = index;
              });
            },
            destinations: destinations,
          ),
          Expanded(child: destinations[destinationIndex].view),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => compose(context),
        icon: Icon(Icons.create),
        label: Text('Compose'),
      ),
    );
  }

  void compose(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return ComposeView();
      },
    );
  }
}
