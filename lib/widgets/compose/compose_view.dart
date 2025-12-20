import 'package:flutter/material.dart';
import 'package:mailbox/api/message.dart';
import 'package:mailbox/cubits/mailbox.dart';
import 'package:mailbox/utils/spacing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComposeView extends StatefulWidget {
  const ComposeView({super.key});

  @override
  State<ComposeView> createState() => _ComposeViewState();
}

class _ComposeViewState extends State<ComposeView> {
  final formKey = GlobalKey<FormState>();
  final to = TextEditingController();
  final subject = TextEditingController();
  final body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          leading: CloseButton(onPressed: close),
          title: Text('Compose'),
          actions: [TextButton(onPressed: send, child: Text('Send'))],
          actionsPadding: EdgeInsets.only(right: Spacing.large),
        ),
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            spacing: 16.0,
            children: [
              TextFormField(
                controller: to,
                decoration: InputDecoration(
                  labelText: 'To',
                  contentPadding: EdgeInsets.only(left: Spacing.large),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Valid recipient email is required';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: subject,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  contentPadding: EdgeInsets.only(left: Spacing.large),
                ),
              ),
              TextFormField(
                controller: body,
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: Spacing.large),
                  hintText: 'Start typing...',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> close() async {
    if (to.text.isNotEmpty || subject.text.isNotEmpty || body.text.isNotEmpty) {
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          icon: Icon(Icons.warning_rounded, color: Colors.amber),
          title: Text('Discard?'),
          content: Text('Are you sure you want to discard this draft?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Discard'),
            ),
          ],
        ),
      );

      if (result == true && mounted) {
        Navigator.of(context).pop();
      }

      return;
    }

    Navigator.of(context).pop();
  }

  void send() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    BlocProvider.of<MailboxCubit>(context).send(
      Message(
        recipient: to.text.trim(),
        sender: 'user@example.com',
        subject: subject.text.trim(),
        text: body.text.trim(),
      ),
    );

    Navigator.of(context).pop();
  }
}
