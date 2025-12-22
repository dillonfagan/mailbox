import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailbox/cubits/mailbox.dart';
import 'package:mailbox/widgets/mailbox/message_tile.dart';

class SentListView extends StatelessWidget {
  const SentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MailboxCubit, MailboxState>(
      builder: (context, mailbox) {
        return ListView.builder(
          itemBuilder: (context, i) {
            final message = mailbox.sent[i];
            return MessageTile(message: message);
          },
          itemCount: mailbox.sent.length,
        );
      },
    );
  }
}
