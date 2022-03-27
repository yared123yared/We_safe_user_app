import 'package:shared_preferences/shared_preferences.dart';
import 'package:wesafeapp/model/User.dart';
import 'package:wesafeapp/model/person.dart';

class Util {
  //User Info management ... Token and Shared Preferences
  Future<void> storeUserInformation(Person user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', user.firstName!);
    await prefs.setString('role', user.role!.roleName!);
    await prefs.setString('picture', user.picture!);
    await prefs.setString('phone', user.phone!);
    await prefs.setString('password', user.password!);
  }

  Future<User> getUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = User(
      fName: prefs.getString("firstName")!,
      role: prefs.getString("role")!,
      imageUrl: prefs.getString("picture")!,
      password: prefs.getString("password")!,
      phone: prefs.getString("phone")!,
    );

    return user;
  }

  Future<void> storeTokenAndExpiration(String expiry, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('expiry', expiry);
  }

  Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }

  Future<String> getExpiryTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token')!;
  }

  DateTime getDateTimeFromString(String dateString) {
    return DateTime.parse(dateString);
  }

  bool isExpired(String expiry) {
    int timeExpiry = int.parse(expiry);
    var date = new DateTime.fromMicrosecondsSinceEpoch(timeExpiry * 1000);
    if (date.isAfter(DateTime.now())) return false;
    return true;
  }
}
