import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Storage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/apiKey.txt');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      List<String> contents = await file.readAsLines();

      return contents[0];
    } catch (e) {
      // If encountering an error, return empty string
      return "";
    }
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$counter');
  }
}
