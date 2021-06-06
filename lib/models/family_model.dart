import 'member_model.dart';

class FamilyModel {
  String familyName;
  List<MemberModel> members;

  FamilyModel({this.familyName, this.members});

  FamilyModel.fromJson(Map<String, dynamic> json) {
    familyName = json['familyName'];
    members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['familyName'] = this.familyName;
    data['members'] = this.members;
    return data;
  }
}
