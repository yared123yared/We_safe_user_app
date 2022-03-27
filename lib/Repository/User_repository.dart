import 'package:meta/meta.dart';
import 'package:wesafeapp/Data_provider/data_provider.dart';
import 'package:wesafeapp/model/User.dart';
import 'package:wesafeapp/model/loginResponse.dart';
import 'package:wesafeapp/model/person.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<LoginResponse> logIn(String email, String password) async {
    print("This is the getUser(email) method in repo");
    return await dataProvider.logIn(email, password);
  }

  Future<LoginResponse> signUp(LoginResponse loginResponse) async {
    print("This is the getUser(email) method in repo");
    return await dataProvider.signUp(loginResponse);
  }
}
