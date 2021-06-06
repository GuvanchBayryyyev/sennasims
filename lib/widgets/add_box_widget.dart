import 'package:flutter/material.dart';

class CustomAddBox extends StatefulWidget {
  final String label;
  final Function onTap;

  CustomAddBox({this.label, this.onTap});

  @override
  _CustomAddBoxState createState() => _CustomAddBoxState();
}

class _CustomAddBoxState extends State<CustomAddBox> {
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
      margin: const EdgeInsets.all(8.0),
      height: 400.0,
      width: 300.0,
      decoration: BoxDecoration(
          border: Border.all(
        color: Color.fromRGBO(206, 206, 206, 1),
        width: 3,
      )),
      child: TextButton(
          onPressed: () async {
            widget.onTap();
          },
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                ),
                Text(
                  widget.label,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}
