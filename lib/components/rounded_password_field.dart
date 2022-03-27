import 'package:flutter/material.dart';
import 'package:wesafeapp/components/text_field_container.dart';
import 'package:wesafeapp/utils/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final bool isObscured;
  final IconButton iconButton;
  final TextEditingController controller;

  RoundedPasswordField(
      {Key? key,
      required this.onChanged,
      required this.controller,
      required this.onSaved,
      required this.isObscured,
      required this.iconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: isObscured,
        onChanged: onChanged,
        controller: controller,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        validator: (String? value) {
          if (value == null) {
            return 'Password is required!';
          }
          if (value == '') {
            return 'Password is required!';
          }
          if (value.length < 6) {
            return "Password has to be at least 6 letters";
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: iconButton,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
