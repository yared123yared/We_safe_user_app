import 'package:flutter/material.dart';
import 'package:wesafeapp/Screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<UserBloc, UserState>(
    //   listener: (_, state) {
    //     if (state is UserLoadSuccess) {
    //       if (state.user.password ==
    //           "asdf") { //On success checks if the email and password matches
    //
    //       }
    //       else {
    //         Fluttertoast.showToast(
    //             msg: "This is Center Short Toast",
    //             toastLength: Toast.LENGTH_SHORT,
    //             gravity: ToastGravity.CENTER,
    //             timeInSecForIosWeb: 1,
    //             backgroundColor: Colors.red,
    //             textColor: Colors.white,
    //             fontSize: 16.0
    //         );
    //       }
    //     }
    //     // if(state is UserLoading){//On loading call the loading event manager UI
    //     //   loading_screen(title:"Login loading");
    //     // }
    //     if (state is UserOperationFailure) { //Toast the message of the Failure
    //       Fluttertoast.showToast(
    //           msg: "This is Center Short Toast",
    //           toastLength: Toast.LENGTH_SHORT,
    //           gravity: ToastGravity.CENTER,
    //           timeInSecForIosWeb: 1,
    //           backgroundColor: Colors.red,
    //           textColor: Colors.white,
    //           fontSize: 16.0
    //       );
    //     }
    //   },
    //   builder: (context, state) {
    //     return Scaffold(
    //       body: Body(state: state,),
    //     );
    //   },
    // );
    return Scaffold(
      body: Body(),
    );
  }
}
