import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/constants.dart';
import 'package:shopping_assistance_system/widgets/text_field_container.dart';

class RoundedNameField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final TextEditingController? controller; // Add this line

  const RoundedNameField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.controller, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller, // Add this line
        cursorColor: kPrimaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your name";
          }
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
