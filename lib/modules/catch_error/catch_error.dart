import 'package:flutter/material.dart';
import 'package:flutter_module_8/modules/catch_error/text_edit.dart';

class CatchError extends StatefulWidget {
  const CatchError({super.key});

  @override
  State<StatefulWidget> createState() => _StateCatchError();
}

class _StateCatchError extends State<CatchError> {
  String fileName = "";
  String textFromFile = "";

  void inputCall(String newFileName, String text) {
    setState(() {
      fileName = newFileName;
      textFromFile = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyTextEdit(
          onTextChanged: (newFileName, text) => inputCall(newFileName, text),
        ),
        Row(
          children: [
            Container(padding: const EdgeInsets.all(15), child: Text(fileName))
          ],
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Text(textFromFile),
          ),
        )
      ],
    ));
  }
}
