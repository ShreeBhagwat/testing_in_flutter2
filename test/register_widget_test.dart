import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter2/register_screen.dart';

import 'widget_tester_extension.dart';

void main() {
  // testWidgetsMultipleScreenSizes('Register-Page', registerWidgetTest);
  testWidgets('Register-Page', (tester) => registerWidgetTest(tester));

}

Future<void> registerWidgetTest(
    WidgetTester tester, ) async {
  await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
  await tester.pumpAndSettle();
  
}
