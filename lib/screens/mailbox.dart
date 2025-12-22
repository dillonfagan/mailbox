import 'package:flutter/material.dart';
import 'package:mailbox/utils/spacing.dart';
import 'package:mailbox/widgets/compose/compose_view.dart';
import 'package:mailbox/widgets/inbox/inbox_list_view.dart';
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
  int viewIndex = 0;
  final views = [InboxListView(), SentListView()];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return buildWideLayout(context);
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Inbox'),
            leading: MenuButton(),
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              CircleAvatar(child: Text('A')),
            ],
            actionsPadding: EdgeInsets.only(right: Spacing.large),
          ),
          drawer: MailNavigationDrawer(
            selectedIndex: viewIndex,
            onDestinationSelected: (index) {
              setState(() {
                viewIndex = index;
              });
            },
          ),
          body: views[viewIndex],
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
        title: Text('Inbox'),
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
            selectedIndex: viewIndex,
            onDestinationSelected: (index) {
              setState(() {
                viewIndex = index;
              });
            },
          ),
          Expanded(child: views[viewIndex]),
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
