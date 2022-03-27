class Role {
  String? roleName;

  Role({this.roleName});

  Role.fromJson(Map<String, dynamic> json) {
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleName'] = this.roleName;
    return data;
  }
}
