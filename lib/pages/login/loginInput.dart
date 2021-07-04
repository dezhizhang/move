import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  String? title;
  String? hint;
  ValueChanged<String>? onChanged;
  ValueChanged<bool>? focusChanged;
  bool? lineStretch = false;
  bool? obscureText = false;
  TextInputType? keyboardType;
  LoginInput(
      {Key? key,
      this.title,
      this.hint,
      this.onChanged,
      this.focusChanged,
      this.lineStretch,
      this.obscureText,
      this.keyboardType})
      : super(key: key);

  _LoginInput createState() => _LoginInput();
}

class _LoginInput extends State<LoginInput> {
  final _focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (widget.focusChanged != null) {
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }

  //页面销毁时
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
