import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesafeapp/Data_provider/User_data.dart';
import 'package:wesafeapp/Repository/repository.dart';
import 'package:wesafeapp/bloc/auth/login/login_bloc.dart';
import 'package:wesafeapp/bloc/auth/signup/signup_bloc.dart';
import 'package:wesafeapp/utils/SplashScreen.dart';
import 'package:wesafeapp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'Screens/OnboardingScreen/onboardingScreen.dart';

void main() {
  UserDataProvider userDataProvider = UserDataProvider(
    httpClient: http.Client(),
  );
  final UserRepository userRepository =
      UserRepository(dataProvider: userDataProvider);
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({required this.userRepository}) : assert(userRepository != null);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(authRepo: this.userRepository)
            // ..add(UserB()),
            ),
        BlocProvider<SignupBloc>(
            create: (_) => SignupBloc(authRepo: this.userRepository)
            // ..add(UserB()),
            ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Auth',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: MySplashScreen(child: OnBoardingScreen())),
    );
  }
}
