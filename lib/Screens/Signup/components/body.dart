import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesafeapp/Screens/Login/login_screen.dart';
import 'package:wesafeapp/bloc/auth/form_submition_status.dart';
import 'package:wesafeapp/bloc/auth/signup/signup_bloc.dart';
import 'package:wesafeapp/bloc/auth/signup/signup_event.dart';
import 'package:wesafeapp/components/already_have_an_account_acheck.dart';
import 'package:wesafeapp/components/rounded_button.dart';
import 'package:wesafeapp/components/rounded_input_field.dart';
import 'package:wesafeapp/components/rounded_password_field.dart';
import 'package:wesafeapp/bloc/auth/signup/signup_state.dart';
import 'ImageProfile.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscrued = true;
  final _myfnameController = TextEditingController();
  final _mylnameController = TextEditingController();
  final _mycityController = TextEditingController();
  final _mysubcityController = TextEditingController();
  final _myworedaController = TextEditingController();
  final _myPhoneController = TextEditingController();
  final _myPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                final formStatus = state.formStatus;
                if (formStatus is SubmissionFailed) {
                  _showSnackBar(context, formStatus.message.toString());
                }
                // if(formStatus is SubmissionSuccess){
                //   _showSnackBar(context, "Successfully logged-in");
                // }
              },
              builder: (_, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "SIGNUP",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ImageProfile(),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return RoundedInputField(
                            controller: _myfnameController,
                            hintText: "First Name",
                            onChanged: (value) {
                              context.read<SignupBloc>().add(
                                  SignupFirstNameChanged(firstName: value));
                            },
                            onSaved: (value) {
                              context.read<SignupBloc>().add(
                                  SignupFirstNameChanged(firstName: value!));
                            },
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return RoundedInputField(
                            controller: _mylnameController,
                            hintText: "Last Name",
                            onChanged: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupLastNameChanged(lastName: value));
                            },
                            onSaved: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupLastNameChanged(lastName: value!));
                            },
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return RoundedInputField(
                            controller: _mycityController,
                            hintText: "City",
                            onChanged: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupCityChanged(city: value));
                            },
                            onSaved: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupCityChanged(city: value!));
                            },
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return RoundedInputField(
                            controller: _mysubcityController,
                            hintText: "Sub-City",
                            onChanged: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupSubityChanged(subcity: value));
                            },
                            onSaved: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupSubityChanged(subcity: value!));
                            },
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return RoundedInputField(
                            controller: _myworedaController,
                            hintText: "Woreda",
                            onChanged: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupWoredaChanged(woreda: value));
                            },
                            onSaved: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupWoredaChanged(woreda: value!));
                            },
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return RoundedInputField(
                            controller: _myPhoneController,
                            hintText: "Phone",
                            onChanged: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupPhoneChanged(phone: value));
                            },
                            onSaved: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupPhoneChanged(phone: value!));
                            },
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return RoundedPasswordField(
                            controller: _myPasswordController,
                            onChanged: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupPasswordChanged(password: value));
                            },
                            onSaved: (value) {
                              context
                                  .read<SignupBloc>()
                                  .add(SignupPasswordChanged(password: value!));
                            },
                            isObscured: isObscrued,
                            iconButton: isObscrued
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscrued = !isObscrued;
                                      });
                                    },
                                    icon: Icon(Icons.visibility))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscrued = !isObscrued;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off)),
                          );
                        },
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return state.formStatus is FormSubmitting
                              ? const CircularProgressIndicator(
                                  color: Colors.black54,
                                )
                              : RoundedButton(
                                  text: "SIGNUP",
                                  press: () {
                                    _formKey.currentState?.save();
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<SignupBloc>()
                                          .add(SignupSubmitted());
                                    }
                                  },
                                );
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 25),
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
