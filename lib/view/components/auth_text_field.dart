
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {Key? key, required TextEditingController controller, hint, errorText,onchanged})
      : _controller = controller,
        _hint = hint,
        _errorText = errorText,
        _onChanged = onchanged,
        super(key: key);

  final TextEditingController _controller;
  final String _hint;
  final String? _errorText;
  final Function(String)? _onChanged;
  @override
  State<InputTextField> createState() => _InputTextFieldState();
}
class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._controller,
      onChanged: widget._onChanged,
      decoration: InputDecoration(
          hintText: widget._hint,
          errorText: widget._errorText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}

