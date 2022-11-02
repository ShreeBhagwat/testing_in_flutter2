import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../test/login_widget_test.dart';
import '../test/register_widget_test.dart';

// Run This: flutter test integration_test/integration_tests.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Integration Tests', () {
    WidgetController.hitTestWarningShouldBeFatal = true;

    testWidgets('Login-Page', (tester) => loginWidgetTest(tester, null));

    testWidgets('Login-Page', (tester) => registerWidgetTest(tester, null));
  });
}
