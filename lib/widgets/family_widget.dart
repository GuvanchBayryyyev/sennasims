import 'package:flutter/material.dart';
import 'package:senna_sims/models/family_model.dart';

class FamilyWidget extends StatefulWidget {
  final FamilyModel family;
  final int index;
  final Function remove;

  FamilyWidget({this.family, this.index, this.remove});
  @override
  _FamilyWidgetState createState() => _FamilyWidgetState();
}

class _FamilyWidgetState extends State<FamilyWidget> {
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
    FamilyModel family = widget.family;
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 400.0,
      decoration: BoxDecoration(
          border: Border.all(
        color: Color.fromRGBO(206, 206, 206, 1),
        width: 3,
      )),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
        Container(
          width: isDesktop ? 280.0 : double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(family.familyName,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromRGBO(0, 120, 183, 1),
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 420.0,
            width: isDesktop ? 280.0 : double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: family.members.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = family.members[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Row(children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              child: Image.network(item.image,
                                  height: 50.0, width: 60.0, fit: BoxFit.fill)),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              item.name,
                              style: TextStyle(
                                  color: Color.fromRGBO(100, 100, 100, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0),
                            ),
                          )
                        ]),
                      ],
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }
}
