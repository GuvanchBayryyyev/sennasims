import 'package:flutter/material.dart';
import 'package:senna_sims/models/company_model.dart';
import 'package:senna_sims/models/member_model.dart';
import 'package:senna_sims/widgets/appBar_desktop_widget.dart';
import 'package:senna_sims/widgets/dropdown_input.dart';
import 'package:senna_sims/widgets/text_button.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var screenSize;

  String _name;
  String _address;
  String _company;
  String _image =
      "https://images.unsplash.com/photo-1510552776732-03e61cf4b144?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80";
  List<String> images = [
    "https://images.unsplash.com/photo-1622712511033-ec8723ff094c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1559629819-638a8f0a4303?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80",
    "https://images.unsplash.com/photo-1596392927852-2a18c336fb78?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1554126807-6b10f6f6692a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80",
    "https://images.unsplash.com/photo-1563306406-e66174fa3787?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"
  ];
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

    setState(() {
      screenSize = screenSize;
    });

    return isDesktop ? _desktop(context) : _mobile(context);
  }

  Widget _mobile(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        appBar: AppBar(
          title: Text("Add New Member"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(key: _formKey, child: _formMobile(context)),
        ));
  }

  Widget _desktop(BuildContext context) {
    return Material(
        child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarDesktop(
                    subtitle: "Create New Member",
                    submit: () => _submit(),
                  ),
                  Container(
                      height: 600.0,
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [_formDesktop(context)]))
                ])));
  }

  Widget _formDesktop(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 400),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text("Name", style: TextStyle(fontSize: 18.0))),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Name"),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text("Address", style: TextStyle(fontSize: 18.0))),
                Expanded(
                  flex: 3,
                  child: CustomDropDown(
                    items: ['Chiang Mai', 'Bangkok', 'Rayong', 'Saraburi'],
                    label: "Address",
                    value: _address,
                    onTap: (value) {
                      setState(() {
                        _address = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text("Company", style: TextStyle(fontSize: 18.0))),
                Expanded(
                  flex: 3,
                  child: CustomDropDown(
                    items: [
                      'Google Co, Ltd',
                      'Facebook Co, Ltd',
                      'Omise Co, Ltd',
                    ],
                    label: "Company",
                    value: _company,
                    onTap: (value) {
                      setState(() {
                        _company = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            _chooseImage(context),
            SizedBox(height: 20),
            CustomButtonInput(
              label: "Submit",
              onTap: () {
                _submit();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _formMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: "Name"),
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Name is required';
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              _name = value;
            });
          },
        ),
        SizedBox(height: 20),
        CustomDropDown(
          items: ['Chiang Mai', 'Bangkok', 'Rayong', 'Saraburi'],
          label: "Address",
          value: _address,
          onTap: (value) {
            setState(() {
              _address = value;
            });
          },
        ),
        SizedBox(height: 20),
        CustomDropDown(
          items: [
            'Google Co, Ltd',
            'Facebook Co, Ltd',
            'Omise Co, Ltd',
          ],
          label: "Company",
          value: _company,
          onTap: (value) {
            setState(() {
              _company = value;
            });
          },
        ),
        _chooseImage(context),
        SizedBox(height: 20),
        CustomButtonInput(
          label: "Submit",
          onTap: () {
            _submit();
          },
        ),
      ],
    );
  }

  _submit() {
    var valid = _formKey.currentState.validate();
    if (!valid) {
      return;
    }

    _formKey.currentState.save();
    if (_address == null || _company == null) {
      _showErrorDialog();
      return;
    }

    MemberModel member = new MemberModel();
    member.image = _image;
    member.address = _address;
    member.company = new CompanyModel(name: _company, address: _address);
    member.name = _name;

    Navigator.pop(context, member);
  }

  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please select fields.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _chooseImage(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 20.0),
      SizedBox(height: 20.0),
      Row(children: [
        Expanded(
          flex: 2,
          child: Text("Profile Image", style: TextStyle(fontSize: 18.0)),
        ),
        Expanded(
          flex: 1,
          child: ClipRRect(
              child: Image.network(_image,
                  height: 70.0, width: 40.0, fit: BoxFit.fill)),
        ),
        Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButtonInput(
                  label: "Choose Image",
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          _selectImage(context, images))),
            ))
      ])
    ]));
  }

  Widget _selectImage(BuildContext context, List<String> images) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    bool isDesktop = screenWidth > 1024;
    return AlertDialog(
      title: const Text(
        'Select Profile Image',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      content: Container(
        width: isDesktop ? screenWidth - 400 : 100,
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: isDesktop ? 135 : screenHeight - 100,
                width: 180,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection:
                        isDesktop ? Axis.horizontal : Axis.vertical,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final item = images[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _image = item;
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          width: 180,
                          height: 135,
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: Image.network(
                                item,
                                fit: BoxFit.fill,
                              )),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
