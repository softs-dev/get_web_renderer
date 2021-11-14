import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_web_renderer/get_web_renderer.dart';

void main() {
  const MethodChannel channel = MethodChannel('get_web_renderer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await GetWebRenderer.platformVersion, '42');
  });
}