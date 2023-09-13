import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/constants.dart';
import 'package:shopping_assistance_system/widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final TextEditingController? controller;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        cursorColor: kPrimaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!value.contains('@')) {
            return 'Invalid email format';
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: 'OpenSans'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
