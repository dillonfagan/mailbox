class Message {
  final String recipient;
  final String sender;
  final String subject;
  final String text;

  const Message({
    required this.recipient,
    required this.sender,
    required this.subject,
    required this.text,
  });
}
