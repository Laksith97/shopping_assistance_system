import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/constants.dart';
import 'package:shopping_assistance_system/widgets/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final TextEditingController? controller;

  const RoundedPasswordField({Key? key, this.controller})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        cursorColor: kPrimaryColor,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          if (value.length < 6) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: "Password",
          hintStyle: TextStyle(fontFamily: 'OpenSans'),
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
