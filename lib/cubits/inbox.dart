import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mailbox/api/message.dart';

class InboxCubit extends Cubit<List<Message>> {
  InboxCubit() : super(List<Message>.empty());

  void send(Message sent) {
    final reply = Message(
      subject: 'Reply: ${sent.subject}',
      text: 'Thank you for your email.',
    );
    emit([...state, reply]);
  }
}
