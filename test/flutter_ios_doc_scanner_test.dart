import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ios_doc_scanner/flutter_ios_doc_scanner.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_ios_doc_scanner');
  bool runOnSimulator = false;
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'pickDocument') {
        if (runOnSimulator) {
          throw PlatformException(
              code: "no_simulator", message: 'Not Implemented on Simulator');
        }
        return ['file://Document/test.jpg'];
      }
      throw PlatformException(
          code: "not_implemented", message: 'Not Implemented on Simulator');
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('pickDocument', () async {
    runOnSimulator = false;
    expect(await FlutterIOSDocScanner().pickDocument(""),
        ['file://Document/test.jpg']);
  });
  test('pickDocument on Simulator', () {
    runOnSimulator = true;
    expect(FlutterIOSDocScanner().pickDocument(""),
        throwsA(isInstanceOf<PlatformException>()));
  });
}
