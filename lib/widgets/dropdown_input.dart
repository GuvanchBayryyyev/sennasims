import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String label;
  final String value;
  final List<String> items;
  final Function onTap;

  CustomDropDown({this.label, this.value, this.items, this.onTap});

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            border: Border.all(
          color: Color.fromRGBO(112, 112, 112, 0.5),
          width: 1,
        )),
        child: DropdownButton<String>(
          value: widget.value,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          underline: Container(),
          hint: Text(widget.label),
          onChanged: (String newValue) {
            widget.onTap(newValue);
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
