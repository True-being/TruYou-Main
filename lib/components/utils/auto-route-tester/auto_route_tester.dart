import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:truyou/components/components.dart';

enum NavType { push, pushAndRemoveUntil, pop }

///Tests basic routing in the app
///Anywhere where the user clicks on a button and it navigates them to another screen
///It allows 3 different types of routing: Push; Push And Remove Until; Pop
class AutoRoute {
  final Widget screen;
  final List<TextFieldKey> process;
  final String activatorKey;
  final String destination;
  final NavType? navType;

  const AutoRoute(
      {required this.screen,
      required this.process,
      required this.activatorKey,
      required this.destination,
      required this.navType});

  void test() {
    MockNavigator navigator = MockNavigator();
    group(
        'Testing navigation from $screen to $destination when $activatorKey is pressed',
        () {
      testWidgets('Tests ${navType.toString()} ${screen.toString()} routing',
          (WidgetTester tester) async {
        //Sets the nav type
        switch (navType) {
          case NavType.push:
            when(() => navigator.push(any())).thenAnswer((_) async {});
            break;
          case NavType.pushAndRemoveUntil:
            when(() => navigator.pushAndRemoveUntil(any(), any()))
                .thenAnswer((_) async {});
            break;
          case NavType.pop:
            when(() => navigator.pop(any())).thenAnswer((_) async {});
            break;
          default:
            when(() => navigator.push(any())).thenAnswer((_) async {});
            throw Exception('NavType is null, please check you entered it');
        }
        //Pumps widget screen
        await tester.pumpWidget(MaterialApp(
          home: MockNavigatorProvider(
            navigator: navigator,
            child: screen,
          ),
        ));

        //Enters textfield if necessary
        if (process.isNotEmpty) {
          for (var textfield in process) {
            var _finder = find.byKey(ValueKey(textfield.key));
            expect(_finder, findsOneWidget, reason: 'Could not find textfield');
            await tester.enterText(_finder, textfield.enter);
          }
        }

        await tester.pump();

        //Finds button to navigate
        //Future expansion, finds element -> Executes action(any element not just buttons)
        var _activator = find.byKey(ValueKey(activatorKey));

        expect(_activator, findsOneWidget,
            reason: 'Could not find activator widget');

        await tester.ensureVisible(_activator);
        await tester.pumpAndSettle();

        await tester.tap(_activator);

        //Verfies route
        switch (navType) {
          case NavType.push:
            verify(() => navigator.push(
                    any(that: isRoute<void>(whereName: equals(destination)))))
                .called(1);
            break;
          case NavType.pushAndRemoveUntil:
            verify(() => navigator.pushAndRemoveUntil(
                any(that: isRoute<void>(whereName: equals(destination))),
                any())).called(1);
            break;
          case NavType.pop:
            verify(() => navigator.pop(any())).called(1);
            break;
          default:
            verify(() => navigator.push(
                    any(that: isRoute<void>(whereName: equals(destination)))))
                .called(1);
            throw Exception('NavType is null, please check you entered it');
        }
      });
    });
  }
}
