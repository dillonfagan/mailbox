import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailbox/api/message.dart';
import 'package:mailbox/cubits/inbox.dart';
import 'package:mailbox/utils/spacing.dart';
import 'package:mailbox/widgets/compose/compose_view.dart';
import 'package:mailbox/widgets/mailbox/message_tile.dart';
import 'package:mailbox/widgets/mailbox/navigation_drawer.dart';
import 'package:mailbox/widgets/shared/menu_button.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      drawer: MailNavigationDrawer(),
      body: BlocBuilder<InboxCubit, List<Message>>(
        builder: (context, inbox) {
          return ListView.builder(
            itemBuilder: (context, i) {
              final message = inbox[i];
              return MessageTile(message: message);
            },
            itemCount: inbox.length,
          );
        },
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
