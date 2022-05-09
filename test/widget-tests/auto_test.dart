import 'package:flutter_test/flutter_test.dart';
import 'package:truyou/components/components.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  ///Tests all the auto tests
  group('Auto testing', () {
    group('Test All TruYou Auto Routing', () => Routes.testAll());

    group('Test All TruYou Validation', () => Fields.testAll());

    group('Test All TruYou Auto Drawer Routing', () => DrawerRoutes.testAll());

    group('Test All navigation for match options dialog',
        () => MatchOptionsDialog.testAll());
  });
}
