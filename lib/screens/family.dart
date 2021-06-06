import 'package:flutter/material.dart';
import 'package:senna_sims/models/family_model.dart';
import 'package:senna_sims/models/member_model.dart';
import 'package:senna_sims/screens/member.dart';
import 'package:senna_sims/widgets/add_box_widget.dart';
import 'package:senna_sims/widgets/member_widget.dart';
import 'package:senna_sims/widgets/appBar_desktop_widget.dart';
import 'package:senna_sims/widgets/text_button.dart';

class FamilyScreen extends StatefulWidget {
  @override
  _FamilyScreenState createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String _noMember = "";
  List<MemberModel> members = new List<MemberModel>();
  String _familyName;

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
    setState(() {
      screenWidth = screenSize.width;
      screenHeight = screenSize.height;
    });
    bool isDesktop = screenSize.width > 1024;

    return isDesktop ? _desktop(context) : _mobile(context);
  }

  Widget _mobile(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      appBar: AppBar(
        title: Text("New Family"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 120,
              height: 20,
              child: CustomButtonInput(
                  label: "Submit",
                  onTap: () {
                    _submit();
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.person_add), onPressed: () => _addNew()),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _formMobile(context),
            members.length == 0
                ? Center(child: Text("No members"))
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final item = members[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                MemberWidget(
                                    member: item,
                                    index: index,
                                    remove: () => _remove(index)),
                              ],
                            ),
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return Material(
        child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(children: [
              AppBarDesktop(
                subtitle: "Create New Family",
                submit: () => _submit(),
              ),
              Container(
                  height: 600.0,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _formDesktop(context),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                                height: 400.0,
                                child: CustomAddBox(
                                  label: "Add New Member",
                                  onTap: () => _addNew(),
                                )),
                            Container(
                              height: 400.0,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: members.length,
                                  itemBuilder: (context, index) {
                                    final item = members[index];
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: MemberWidget(
                                          member: item,
                                          index: index,
                                          remove: () => _remove(index)),
                                    );
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ])));
  }

  Widget _formMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
            key: _formKey,
            child: (Container(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Family Name"),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Family Name is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _familyName = value;
                  });
                },
              ),
            ))),
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Text(
            _noMember,
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }

  Widget _formDesktop(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 40),
      child: Column(
        children: <Widget>[
          Form(
              key: _formKey,
              child: Row(
                children: [
                  Text("Family Name", style: TextStyle(fontSize: 22.0)),
                  SizedBox(width: 20),
                  Container(
                    width: 300,
                    child: TextFormField(
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Family Name is required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          _familyName = value;
                        });
                      },
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              _noMember,
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }

  _remove(index) {
    List<MemberModel> list = members;
    list.removeAt(index);

    setState(() {
      members = list;
    });
  }

  _submit() {
    var valid = _formKey.currentState.validate();
    if (!valid) return;

    _formKey.currentState.save();

    if (members.length == 0) {
      setState(() {
        _noMember = "Please add at least 1 member";
      });
      return;
    }
    FamilyModel model = new FamilyModel();
    model.familyName = _familyName;
    model.members = members;

    Navigator.pop(context, model);
  }

  _addNew() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => MemberScreen()));
    if (result is MemberModel) {
      List<MemberModel> mem = members;
      mem.add(result);
      setState(() {
        members = mem;
      });
    }
  }
}
