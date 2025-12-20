import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailbox/api/message.dart';

class MailboxCubit extends Cubit<MailboxState> {
  MailboxCubit() : super(MailboxState.empty());

  void send(Message sent) {
    final reply = Message(
      recipient: sent.sender,
      sender: sent.recipient,
      subject: sent.subject.isEmpty
          ? 'Reply: No Subject'
          : 'Reply: ${sent.subject}',
      text: 'Thank you for your email.',
    );

    state.sent.add(sent);
    state.inbox.add(reply);

    emit(MailboxState(inbox: state.inbox, sent: state.sent));
  }
}

class MailboxState {
  final List<Message> inbox;
  final List<Message> sent;

  MailboxState({required this.inbox, required this.sent});

  factory MailboxState.empty() {
    return MailboxState(inbox: [], sent: []);
  }
}
