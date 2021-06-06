import 'package:flutter/material.dart';

class CustomButtonInput extends StatefulWidget {
  final String label;
  final Function onTap;
  final IconData icon;

  CustomButtonInput({this.label, this.onTap, this.icon});

  @override
  _CustomButtonInputState createState() => _CustomButtonInputState();
}

class _CustomButtonInputState extends State<CustomButtonInput> {
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
    return TextButton(
        onPressed: () async {
          widget.onTap();
        },
        child: Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
              color: Color.fromRGBO(204, 243, 255, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(
                color: Color.fromRGBO(0, 120, 183, 1),
                width: 3,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon != null ? Icon(widget.icon) : Container(),
              Text(
                widget.label,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
