import 'package:flutter/material.dart';
import 'package:truyou/screens/app_root.dart';
import 'package:flutter_test/flutter_test.dart';

import '../constants/constants_export.dart';

///Tests the drawer buttons
class AutoDrawerRoute {
  ///Navigates to a specific drawer route and executes more tests on the screen
  static void navigateTo(String testName, String drawerItemKey,
      List<Function(WidgetTester)> processes) {
    testWidgets(testName, (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AppRoot()));

      final _menuButton = find.byKey(ValueKey(Keys.findMatchesMenuButton));

      expect(_menuButton, findsOneWidget);

      await tester.ensureVisible(_menuButton);
      await tester.pumpAndSettle();
      await tester.tap(_menuButton);
      await tester.pumpAndSettle();

      final _drawItemButton = find.byKey(ValueKey(drawerItemKey));

      expect(_drawItemButton, findsOneWidget);

      await tester.ensureVisible(_drawItemButton);
      await tester.pumpAndSettle();
      await tester.tap(_drawItemButton);
      await tester.pumpAndSettle();

      for (var process in processes) {
        await process.call(tester);
      }
    });
  }

  ///Tests and verifies a specific route is navigated too
  static void test(String drawerItemKey, String? verify) {
    testWidgets('Tests navigation to $drawerItemKey',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: AppRoot()));

      final _menuButton = find.byKey(ValueKey(Keys.findMatchesMenuButton));

      expect(_menuButton, findsOneWidget);

      await tester.ensureVisible(_menuButton);
      await tester.pumpAndSettle();
      await tester.tap(_menuButton);
      await tester.pumpAndSettle();

      final _drawItemButton = find.byKey(ValueKey(drawerItemKey));

      expect(_drawItemButton, findsOneWidget);

      await tester.ensureVisible(_drawItemButton);
      await tester.pumpAndSettle();
      await tester.tap(_drawItemButton);
      await tester.pumpAndSettle();

      if (verify != null) {
        final _verifyText = find.text(verify);

        expect(_verifyText, findsOneWidget);
      }
    });
  }
}
