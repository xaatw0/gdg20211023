import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:gdg20211023/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });
  const iPhone55 =
      Device(name: 'iPhone55', size: Size(414, 736), devicePixelRatio: 3.0);
  const iPad129 =
      Device(name: 'iPad129', size: Size(1366, 1024), devicePixelRatio: 2.0);

  List<Device> devices = [iPhone55, iPad129];

  testGoldens('normal', (tester) async {
    await tester.pumpWidgetBuilder(
      MyApp(),
    );

    await multiScreenGolden(
      tester,
      'myHomePage_0init',
      devices: devices,
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await multiScreenGolden(
      tester,
      'myHomePage_1tapped',
      devices: devices,
    );
  });
}
