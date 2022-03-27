class Address {
  String? city;
  String? subcity;
  String? kebele;
  int? latitude;
  int? longtiude;

  Address(
      {this.city, this.subcity, this.kebele, this.latitude, this.longtiude});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    subcity = json['subcity'];
    kebele = json['kebele'];
    latitude = json['latitude'];
    longtiude = json['longtiude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['subcity'] = this.subcity;
    data['kebele'] = this.kebele;
    data['latitude'] = this.latitude;
    data['longtiude'] = this.longtiude;
    return data;
  }
}
