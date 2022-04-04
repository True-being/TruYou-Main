import 'package:flutter/material.dart';
import 'package:truyou/components/components.dart';

//A generalized drop down for any list of items
class CustomDropDown extends StatefulWidget {
  final String? defaultValue;
  final String title;
  final String hintText;
  final Function(String?) onValueChanged;
  final List<String?> items;

  const CustomDropDown(
      {Key? key,
      required this.defaultValue,
      required this.title,
      required this.hintText,
      required this.onValueChanged,
      required this.items})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _selectedValue = '';

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(_size.width * 0.01),
      child: Column(
        children: [
          //Dropdown title
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(ResponsiveWidget.size(
                  context, _size.width * 0.02, _size.width * 0.01)),
              child: Text(widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveWidget.size(
                          context, _size.width * 0.05, _size.width * 0.025),
                      fontWeight: FontWeight.w500)),
            ),
          ),
          //Drop down selected
          Padding(
              padding: EdgeInsets.all(ResponsiveWidget.size(
                  context, _size.width * 0.02, _size.width * 0.01)),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
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
                        filled: true,
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontSize: ResponsiveWidget.size(context,
                                _size.width * 0.04, _size.width * 0.025))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedValue!.isEmpty
                            ? widget.defaultValue
                            : _selectedValue,
                        isDense: true,
                        dropdownColor: Constants.background_color,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedValue = newValue;
                            //Exposes valud for usage in the file where widget was rendered from
                            widget.onValueChanged(_selectedValue);
                          });
                        },
                        items: widget.items.map((String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value!,
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: ResponsiveWidget.size(context,
                                      _size.width * 0.04, _size.width * 0.02)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
