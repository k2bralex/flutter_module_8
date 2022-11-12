import 'package:flutter/material.dart';

///Add callBack function [TextFieldCallback] to return file name and
///file content from widget
typedef void TextFieldCallback(String fileName);

///To get text from text field add [TextEditingController],
///initiate [TextFieldCallback] and
///customize TextField
class MyTextEdit extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextFieldCallback onTextChanged;

  MyTextEdit({super.key, required this.onTextChanged});

    @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: _controller,
              focusNode: FocusNode(),
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  borderSide: BorderSide(width: 2, color: Colors.black),
                ),
                hintText: "Open file",
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                //print(_controller.text);
                /*String response =
                    await fetchFileFromAssets("assets/${_controller.text}.txt");*/
                onTextChanged(_controller.text);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                padding: const EdgeInsets.all(21.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),
              child: const Text("Find"),
            ),
          ),
        ],
      ),
    );
  }
}
