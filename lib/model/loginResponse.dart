import 'package:wesafeapp/model/person.dart';
import 'package:wesafeapp/model/role.dart';

class LoginResponse {
  String? identificationCard;
  Role? role;
  Person? person;

  LoginResponse({this.identificationCard, this.role, this.person});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    identificationCard = json['identificationCard'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identificationCard'] = this.identificationCard;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.person != null) {
      data['person'] = this.person!.toJson();
    }
    return data;
  }
}
