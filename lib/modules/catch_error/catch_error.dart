import 'package:flutter/material.dart';
import 'package:flutter_module_8/modules/catch_error/my_text_edit.dart';

import '../../src/fetch_file.dart';

class CatchError extends StatefulWidget {
  const CatchError({super.key});

  @override
  State<StatefulWidget> createState() => _StateCatchError();
}

class _StateCatchError extends State<CatchError> {
  String fileName = "";

  void inputCall(String newFileName) {
    setState(() {
      fileName = newFileName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyTextEdit(
          onTextChanged: (newFileName) => inputCall(newFileName),
        ),
        Row(
          children: [
            Container(padding: const EdgeInsets.all(15), child: Text(fileName))
          ],
        ),
        Expanded(
          flex: 1,
          child: FutureBuilder(
            future: fetchFileFromAssets("assets/$fileName.txt"),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text("No connection with server"),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  return Center(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.all(15),
                        child: Text(snapshot.data!)),
                  );
              }
            },
          ),
        ),
      ],
    ));
  }
}
