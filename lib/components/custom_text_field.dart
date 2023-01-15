import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required TextEditingController controller, isPassword, hint})
      : _controller = controller,
        _isPassword = isPassword,
        _hint = hint,
        super(key: key);

  final TextEditingController _controller;
  final bool _isPassword;
  final String _hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: _isPassword,
      decoration: InputDecoration(
        suffixIcon: _isPassword? IconButton(icon: Icon(Icons.remove_red_eye_outlined),onPressed: () {
          
        },) : null,
          hintText: _hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
