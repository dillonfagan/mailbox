import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailbox/cubits/mailbox.dart';
import 'package:mailbox/widgets/mailbox/message_tile.dart';

class InboxListView extends StatelessWidget {
  const InboxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MailboxCubit, MailboxState>(
      builder: (context, mailbox) {
        return ListView.builder(
          itemBuilder: (context, i) {
            final message = mailbox.inbox[i];
            return MessageTile(message: message);
          },
          itemCount: mailbox.inbox.length,
        );
      },
    );
  }
}
