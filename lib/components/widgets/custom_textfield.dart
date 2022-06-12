import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truyou/components/components.dart';

///A generalized textfield for standard text input
///Textfield title - On top
///Textfield - Below
class CustomTextField extends StatelessWidget {
  final Key textFieldKey;
  final String title;
  final String hintText;
  final int maxLines;
  final Function(String?) validator;
  final List<TextInputFormatter> formatter;
  final TextEditingController controller;
  final bool? obsecure;
  final String? char;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? showLabel;

  const CustomTextField({
    Key? key,
    required this.textFieldKey,
    required this.title,
    required this.hintText,
    required this.maxLines,
    required this.validator,
    required this.formatter,
    required this.controller,
    this.showLabel,
    this.horizontalPadding,
    this.verticalPadding,
    this.obsecure,
    this.char,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding != null
              ? verticalPadding!
              : ResponsiveWidget.size(context, _size.width * 0.01, 0.0),
          horizontal: horizontalPadding != null
              ? horizontalPadding!
              : ResponsiveWidget.size(
                  context, _size.width * 0.01, _size.width * 0.3)),
      child: Column(
        children: [
          //Textfield title
          Visibility(
            visible: showLabel != null ? showLabel! : true,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    ResponsiveWidget.size(
                        context, _size.width * 0.02, _size.width * 0.015),
                    ResponsiveWidget.size(
                        context, _size.width * 0.02, _size.width * 0.005),
                    ResponsiveWidget.size(context, _size.width * 0.02, 0.0),
                    ResponsiveWidget.size(context, _size.width * 0.02, 0.0)),
                child: Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveWidget.size(
                            context, _size.width * 0.05, _size.width * 0.02),
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          //Textfield
          Padding(
            padding: EdgeInsets.all(ResponsiveWidget.size(
                context, _size.width * 0.02, _size.width * 0.01)),
            child: TextFormField(
              key: textFieldKey,
              cursorColor: Constants.sky_blue,
              controller: controller,
              validator: (String? text) => validator(text),
              inputFormatters: formatter,
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: ResponsiveWidget.size(
                      context, _size.width * 0.04, _size.width * 0.02)),
              maxLines: maxLines,
              obscureText: obsecure != null ? obsecure! : false,
              obscuringCharacter: char != null ? char! : '•',
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  fillColor: Colors.grey[900],
                  errorStyle: TextStyle(
                      fontSize: ResponsiveWidget.size(
                          context, _size.width * 0.03, _size.width * 0.015)),
                  filled: true,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: ResponsiveWidget.size(
                          context, _size.width * 0.04, _size.width * 0.02))),
            ),
          ),
        ],
      ),
    );
  }
}
