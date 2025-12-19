import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailbox/api/message.dart';
import 'package:mailbox/cubits/inbox.dart';
import 'package:mailbox/widgets/compose/compose_view.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          CircleAvatar(child: Text('CD')),
        ],
        actionsPadding: EdgeInsets.only(right: 12.0),
      ),
      body: BlocBuilder<InboxCubit, List<Message>>(
        builder: (context, inbox) {
          return ListView.builder(
            itemBuilder: (context, i) {
              final message = inbox[i];
              return ListTile(
                leading: CircleAvatar(child: Text('AB')),
                title: Text(message.subject ?? 'No Subject'),
                subtitle: Text(
                  message.text ?? 'No content',
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {},
              );
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
