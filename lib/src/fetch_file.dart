import 'package:flutter/services.dart';

///Add [catchError] to handle if any error
Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle
      .loadString(assetsPath)
      .then((value) => value)
      .catchError((e) => "Error: $e" );
}
