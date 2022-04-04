import 'package:flutter/material.dart';
import 'package:wesafeapp/components/text_field_container.dart';
import 'package:wesafeapp/utils/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final TextEditingController controller;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.icon = Icons.person,
    required this.onChanged, required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        onSaved: onSaved,
        controller: controller,
        cursorColor: kPrimaryColor,
        validator: (String? value) {
          if (value == null) {
            return '$hintText is required!';
          }
          if (value == '') {
            return '$hintText is required!';
          }
          if (hintText=="Email"){
            if(!RegExp (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
              return "Incorrect Email Address";
            }}
          if (hintText=="Phone"){
            if(!RegExp (r"^[0-9]+").hasMatch(value)) {
              return "Incorrect Phone Number";
            }
            if (value.length < 9) {
              return 'Please provide you complete Phone number';
            }
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),

          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
