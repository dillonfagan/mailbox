import 'package:flutter/material.dart';
import 'package:mailbox/api/message.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(message.sender.substring(0, 2).toUpperCase()),
      ),
      title: Text(message.sender),
      subtitle: Text(
        message.subject.isEmpty ? 'No Subject' : message.subject,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
    );
  }
}
