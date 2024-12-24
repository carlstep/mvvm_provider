// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userListModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userListModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

const defaultCompanyValues = Company(
    name: 'no Company name value',
    catchPhrase: 'no catchPhrase value',
    bs: 'no bs value');

class UserModel {
  int? id;
  String name;
  String? username;
  String email;
  Address? address;
  String? phone;
  String? website;
  Company company;

  UserModel({
    this.id,
    this.name = '',
    this.username,
    this.email = '',
    this.address,
    this.phone,
    this.website,
    this.company = defaultCompanyValues,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // json["name"] = null;
    return UserModel(
      id: json["id"],
      name: json["name"] ?? 'no name value',
      username: json["username"],
      email: json["email"] ?? 'no email value',
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      phone: json["phone"],
      website: json["website"],
      company: Company.fromJson(json["company"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo? geo;

  Address({
    this.street = '',
    this.suite = '',
    this.city = '',
    this.zipcode = '',
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    // json["city"] = null;
    return Address(
      street: json["street"] ?? 'no street value',
      suite: json["suite"] ?? 'no suite value',
      city: json["city"] ?? 'no city value',
      zipcode: json["zipcode"] ?? 'no zipcode value',
      geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
      };
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  const Company({
    this.name = '',
    this.catchPhrase = '',
    this.bs = '',
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    // json["name"] = null;

    return Company(
      name: json["name"] ?? 'no Cname value',
      catchPhrase: json["catchPhrase"],
      bs: json["bs"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
