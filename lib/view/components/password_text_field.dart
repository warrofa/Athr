
import 'package:flutter/material.dart';

import '../../Core/constants/image_constants.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {Key? key,
      required TextEditingController controller,
      hint,
      hasIcon = false,errorText,onchanged})
      : _controller = controller,
        _hint = hint,
        _hasIcon = hasIcon,
        _errorText = errorText,
        _onChanged = onchanged,
        super(key: key);

  final TextEditingController _controller;
  final String _hint;
  final bool _hasIcon;
  final Function(String)? _onChanged;
  final bool firstPassword = false;
  final String? _errorText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscure = true;
  Image icons = Image.asset(ImageConstant.showPassword,width: 20);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._controller,
      obscureText: obscure,
      onChanged: widget._onChanged,
    
      decoration: InputDecoration(
        errorText: widget._errorText,
          suffixIcon: widget._hasIcon
              ? IconButton(
                  icon: icons,
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                      icons = obscure? Image.asset(ImageConstant.showPassword,width: 20,):Image.asset(ImageConstant.hidePassword,width: 20);
                    });
                  },
                )
              : null,
          hintText: widget._hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
