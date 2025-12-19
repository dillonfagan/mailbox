import 'package:flutter/material.dart';
import 'package:mailbox/api/message.dart';
import 'package:mailbox/cubits/inbox.dart';
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

  void send() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    BlocProvider.of<InboxCubit>(
      context,
    ).send(Message(subject: subject.text.trim(), text: body.text.trim()));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          leading: CloseButton(),
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
}
