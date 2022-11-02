import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_in_flutter2/constants.dart';
import 'package:testing_in_flutter2/login_screen.dart';
import 'widget_tester_extension.dart';

void main() {
  testWidgetsMultipleScreenSizes('Login-Page', loginWidgetTest);
}

Future<void> loginWidgetTest(
    WidgetTester tester, TestCaseScreenInfo? testCaseScreenInfo) async {

  await tester.pumpWidget(MaterialApp(
    home: LoginScreen(),
  ));

  await tester.pumpAndSettle();

  final emailTextField = find.byKey(emailTextKey);
  final passwordTextField = find.byKey(passwordTextKey);
  final loginButton = find.byKey(loginButtonKey);

  expect(emailTextField, findsOneWidget);
  expect(passwordTextField, findsOneWidget);
  expect(loginButton, findsOneWidget);

  await doGolden('Login-Page', 'Initial-State', testCaseScreenInfo);

// Enter Invalid login credentials and check for error messages
  await tester.enterText(emailTextField, 'abcd');
  await tester.enterText(passwordTextField, '1234');

  await tester.tap(loginButton);

  await tester.pumpAndSettle();
  final emailErrorText = find.text(kEmailErrorText);
  expect(emailErrorText, findsOneWidget);
  final passwordErrorText = find.text(kPasswordErrorText);

  expect(passwordErrorText, findsOneWidget);
  await doGolden('Login-Page', 'Error-State', testCaseScreenInfo);

  // Enter Valid login credentials and check for error messages
  await tester.enterText(emailTextField, 'abcd@gmail.com');
  await tester.enterText(passwordTextField, '1234567');

  // Goldens after valid creds are entered

  await doGolden('Login-Page', 'Valid-Creds', testCaseScreenInfo);

  await tester.tap(loginButton);

  await tester.pumpAndSettle();
  expect(emailErrorText, findsNothing);
  expect(passwordErrorText, findsNothing);

  // Check if the user is navigated to home screen
  final homeScreenText = find.byKey(homeScreenTextKey);
  expect(homeScreenText, findsOneWidget);
  await doGolden('Login-Page', 'Home-Screen', testCaseScreenInfo);
  
  
}
