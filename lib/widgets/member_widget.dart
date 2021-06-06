import 'package:flutter/material.dart';
import 'package:senna_sims/models/member_model.dart';

class MemberWidget extends StatefulWidget {
  final MemberModel member;
  final Function remove;
  final int index;

  MemberWidget({this.member, this.remove, this.index});
  @override
  _MemberWidgetState createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  var screenWidth;
  var screenHeight;
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
    var screenSize = MediaQuery.of(context).size;
    bool isDesktop = screenSize.width > 1024;
    MemberModel member = widget.member;

    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 400.0,
      decoration: BoxDecoration(
          border: Border.all(
        color: Color.fromRGBO(112, 112, 112, 0.5),
        width: 2,
      )),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: isDesktop ? 280.0 : double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => widget.remove(),
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            Row(
              children: [
                ClipRRect(
                    child: Image.network(member.image,
                        height: 70.0, width: 80.0, fit: BoxFit.fill)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(member.name,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Color.fromRGBO(0, 120, 183, 1),
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address",
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
                Text(member.address,
                    style: TextStyle(
                      fontSize: 22.0,
                    )),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Company",
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(member.company.name,
                        style: TextStyle(
                          fontSize: 22.0,
                        )),
                    Text(member.company.address,
                        style: TextStyle(
                          fontSize: 22.0,
                        )),
                  ],
                ),
                SizedBox(height: 20.0),
              ],
            )
          ]),
    );
  }
}
