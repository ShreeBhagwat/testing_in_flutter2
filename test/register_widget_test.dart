import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter2/register_screen.dart';

import 'widget_tester_extension.dart';

void main() {
  testWidgetsMultipleScreenSizes('Register-Page', registerWidgetTest);
}

Future<void> registerWidgetTest(
    WidgetTester tester, TestCaseScreenInfo? testCaseScreenInfo) async {
  await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
  await tester.pumpAndSettle();
  await doGolden('Register-page', 'Initial Pagee', testCaseScreenInfo);
}
