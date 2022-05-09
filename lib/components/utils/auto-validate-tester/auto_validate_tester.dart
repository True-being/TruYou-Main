import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';
import 'package:flutter_test/flutter_test.dart';

///Validates all textfields fully
class AutoValidate {
  final Widget screen;
  final String activatorKey;
  final TextFieldKey textfield;
  final TextInputAction? inputAction;

  const AutoValidate(
      {required this.screen,
      required this.activatorKey,
      required this.textfield,
      this.inputAction});

  void test() {
    //Creates a group with all the tests of the textfields being validated
    group('${textfield.key} validation', () {
      for (var validator in textfield.validators) {
        var mapEntry = validator.entries.first;
        _validate(mapEntry.key, mapEntry.value);
      }
    });
  }

  ///Validates a singular text field
  void _validate(String enter, String validatedMessage) {
    testWidgets('Testing $enter to give => $validatedMessage on $screen',
        (WidgetTester tester) async {
      //Pumps widget
      await tester.pumpWidget(MaterialApp(home: screen));
      //Finds textfield
      final _textfield = find.byKey(ValueKey(textfield.key));
      //Enters text
      await tester.enterText(_textfield, enter);
      await tester.pumpAndSettle();
      //Finds activator button and taps it
      final _button = find.byKey(ValueKey(activatorKey));
      await tester.ensureVisible(_button);
      await tester.pumpAndSettle();
      await tester.tap(_button);
      await tester.pump();

      //Finds validation text
      final _validationMessage = find.text(validatedMessage);
      //Finds validation text matching validation text
      final _validationText = find
          .descendant(of: _textfield, matching: _validationMessage)
          .first
          .evaluate()
          .single
          .widget as Text;

      //Checks if they match
      expect(_validationText.data, validatedMessage,
          reason: '${textfield.key} validation text: ${_validationText.data}');
    });
  }
}
