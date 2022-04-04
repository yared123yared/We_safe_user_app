import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wesafeapp/Screens/Home/home_page.dart';
import 'package:wesafeapp/Screens/Signup/signup_screen.dart';
import 'package:wesafeapp/bloc/auth/form_submition_status.dart';
import 'package:wesafeapp/bloc/auth/login/login_bloc.dart';
import 'package:wesafeapp/bloc/auth/login/login_event.dart';
import 'package:wesafeapp/bloc/auth/login/login_state.dart';
import 'package:wesafeapp/components/already_have_an_account_acheck.dart';
import 'package:wesafeapp/components/rounded_button.dart';
import 'package:wesafeapp/components/rounded_input_field.dart';
import 'package:wesafeapp/components/rounded_password_field.dart';

import 'background.dart';

class Body extends StatefulWidget {
  // final UserState state;
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscrued = true;
  final _myemailController = TextEditingController();
  final _myPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/password.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            BlocConsumer<LoginBloc, LoginState>(listener: (_, state) {
              final formStatus = state.formStatus;
              if (formStatus is SubmissionFailed) {
                _showSnackBar(context, formStatus.message.toString());
              }
              if (formStatus is SubmissionSuccess) {
                _showSnackBar(context, "Successfully logged-in");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              }
            }, builder: (_, state) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return RoundedInputField(
                          controller: _myemailController,
                          hintText: "Phone",
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(LoginUsernameChanged(username: value));
                          },
                          onSaved: (String? newValue) {
                            context
                                .read<LoginBloc>()
                                .add(LoginUsernameChanged(username: newValue!));
                          },
                        );
                      },
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return RoundedPasswordField(
                          controller: _myPasswordController,
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(LoginPasswordChanged(password: value));
                          },
                          isObscured: isObscrued,
                          iconButton: isObscrued
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscrued = !isObscrued;
                                    });
                                  },
                                  icon: const Icon(Icons.visibility))
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscrued = !isObscrued;
                                    });
                                  },
                                  icon: const Icon(Icons.visibility_off)),
                          onSaved: (String? newValue) {},
                        );
                      },
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return state.formStatus is FormSubmitting
                            ? const CircularProgressIndicator(
                                color: Colors.black54,
                              )
                            : RoundedButton(
                                text: "LOGIN",
                                press: () {
                                  _formKey.currentState?.save();

                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return HomePage();
                                        },
                                      ),
                                    );
                                    // context
                                    //     .read<LoginBloc>()
                                    //     .add(LoginSubmitted());

                                    print("Pressed");
                                  }
                                },
                              );
                      },
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
