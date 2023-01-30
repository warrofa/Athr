// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    required controller,
  }) : _controller = controller,super(key: key);
  final TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: "Title",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      );
  }
}
