import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:wesafeapp/model/User.dart';
import 'package:wesafeapp/model/loginResponse.dart';
import 'package:wesafeapp/model/person.dart';
import 'package:wesafeapp/utils/util.dart';

class UserDataProvider {
  final _baseUrl = 'https://wesafeservice.herokuapp.com';
  final http.Client httpClient;

  UserDataProvider({required this.httpClient}) : assert(httpClient != null);
  Util util = new Util();

  Future<LoginResponse> logIn(String email, String password) async {
    print("This is the create method");
    try {
      final response = await httpClient.post(
          Uri.http('wesafeservice.herokuapp.com', '/api/persons/authenticate'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          // body: jsonEncode(<String, dynamic>{
          //   "FullName": user.fName,
          //   "Email": user.email,
          //   "Password": user.password,
          //   "Phone": user.phone,
          //   "Picture":"Assets/assets/fixit.png",
          //   "Role": "USER"
          // }),
          body: jsonEncode({
            "identificationCard": "string",
            "role": {"roleName": "User"},
            "person": {
              "firstName": "Ashenafi",
              "lastName": "Chufamo",
              "password": "ashuashu",
              "phone": "0944060864",
              "picture": "ashu.jpg",
              "sex": "male",
              "address": {
                "city": "Addis",
                "subcity": "Nsl",
                "kebele": "01",
                "latitude": 100,
                "longtiude": 80
              },
              "role": {"roleName": "User"}
            }
          }));

      print("done");

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("================");
          print("Hello this works");
          print("qqqqqqqqqqqqqqqqq");
          print("Hello this works");
          print("================");
        }
        LoginResponse user = LoginResponse.fromJson(jsonDecode(response.body));
        String token = response.headers['token'].toString();
        String expiry = response.headers['expiry_date'].toString();

        await util.storeUserInformation(user.person!);
        await util.storeTokenAndExpiration(expiry, token);
        return user;
      } else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to login User.');
      }
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> signUp(LoginResponse loginResponse) async {
    try {
      final response = await httpClient.post(
          Uri.http('wesafeservice.herokuapp.com', '/api/users'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "identificationCard": "string",
            "role": {"roleName": "User"},
            "person": {
              "firstName": "Ashenafi",
              "lastName": "Chufamo",
              "password": "ashuashu",
              "phone": "0944060864",
              "picture": "ashu.jpg",
              "sex": "male",
              "address": {
                "city": "Addis",
                "subcity": "Nsl",
                "kebele": "01",
                "latitude": 100,
                "longtiude": 80
              },
              "role": {"roleName": "User"}
            }
          }));

      print("done");

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("================");
          print("Hello this works");
          print("qqqqqqqqqqqqqqqqq");
          print("Hello this works");
          print("================");
        }
        LoginResponse user = LoginResponse.fromJson(jsonDecode(response.body));
        String token = response.headers['token'].toString();
        String expiry = response.headers['expiry_date'].toString();

        await util.storeUserInformation(user.person!);
        await util.storeTokenAndExpiration(expiry, token);
        return user;
      } else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to login User.');
      }
    } on Exception catch (e) {
      rethrow;
    }
  }
}
