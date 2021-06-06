import 'company_model.dart';

class MemberModel {
  String name;
  String address;
  CompanyModel company;
  String image;

  MemberModel({this.name, this.company, this.image, this.address});

  MemberModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    company = json['company'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['company'] = this.company;
    data['image'] = this.image;
    return data;
  }
}
