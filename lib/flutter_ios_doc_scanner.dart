import 'dart:async';
import 'package:flutter_ios_doc_scanner/src/flutter_ios_doc_scanner_plugin.dart';

class FlutterIOSDocScanner {
  final _plugin = FlutterIOSDocScannerPlugin.instance();
  Future<List<String>> pickDocument(String simulatorImagePath) {
    return _plugin.pickDocument(simulatorImagePath);
  }
}
