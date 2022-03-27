import 'package:wesafeapp/model/Address.dart';
import 'package:wesafeapp/model/role.dart';

class Person {
  String? firstName;
  String? lastName;
  String? password;
  String? phone;
  String? picture;
  String? sex;
  Address? address;
  Role? role;

  Person(
      {this.firstName,
      this.lastName,
      this.password,
      this.phone,
      this.picture,
      this.sex,
      this.address,
      this.role});

  Person.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    password = json['password'];
    phone = json['phone'];
    picture = json['picture'];
    sex = json['sex'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['picture'] = this.picture;
    data['sex'] = this.sex;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}
