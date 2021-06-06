import 'package:flutter/material.dart';
import 'package:senna_sims/models/company_model.dart';
import 'package:senna_sims/models/family_model.dart';
import 'package:senna_sims/models/member_model.dart';
import 'package:senna_sims/screens/family.dart';
import 'package:senna_sims/widgets/add_box_widget.dart';
import 'package:senna_sims/widgets/family_widget.dart';
import 'package:senna_sims/widgets/appBar_desktop_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<FamilyModel> famList = new List<FamilyModel>();

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

    List<MemberModel> members = new List<MemberModel>();
    for (var i = 0; i < 5; i++) {
      members.add(new MemberModel(
        name: "Nun Senna",
        image:
            "https://images.unsplash.com/photo-1622726299476-3c49a9cbbd1f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
        address: "321/12 phrakanin Bangkok",
        company: new CompanyModel(
            name: "Comop", address: "321/12 phrakanin Bangkok"),
      ));
    }

    return isDesktop ? _desktop(context) : _mobile(context);
  }

  Widget _desktop(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarDesktop(),
            Container(
              height: 400.0,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                        height: 400.0,
                        child: CustomAddBox(
                          label: "Add New Family",
                          onTap: () => _addNew(),
                        )),
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: famList.length,
                        itemBuilder: (context, index) {
                          final item = famList[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: FamilyWidget(
                              family: item,
                              index: index,
                              remove: () => _remove(index),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobile(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        appBar: AppBar(
          title: Text("SennaSims"),
          actions: [
            TextButton(
                onPressed: () => _addNew(),
                child: Icon(
                  Icons.add,
                ))
          ],
        ),
        body: Container(
            child: famList.length == 0
                ? Center(child: Text("No Families"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: famList.length,
                    itemBuilder: (context, index) {
                      final item = famList[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            FamilyWidget(
                              family: item,
                              index: index,
                              remove: () => _remove(index),
                            )
                          ],
                        ),
                      );
                    })));
  }

  _remove(index) {
    List<FamilyModel> list = famList;
    list.removeAt(index);

    setState(() {
      famList = list;
    });
  }

  _addNew() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FamilyScreen()));
    if (result is FamilyModel) {
      List<FamilyModel> list = famList;
      list.add(result);
      setState(() {
        famList = list;
      });
    }
  }
}
