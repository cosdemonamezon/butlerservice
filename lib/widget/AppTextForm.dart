import 'package:butlerservice/constants.dart';
import 'package:flutter/material.dart';

class AppTextForm extends StatefulWidget {
  AppTextForm({
    Key? key,
    this.decoration,
    this.keyboardType,
    this.controller,
    this.labelStyle,
    this.labelText,
    this.hintText,
    this.validator,
    this.isPassword = false,
    this.enabled = true,
    this.maxline,
    this.obscureText,
  }) : super(key: key);

  InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextStyle? labelStyle;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final bool enabled;

  final dynamic obscureText;
  int? maxline;

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
  late bool _show = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        // side: BorderSide(
        //   color: Colors.grey,
        // ),
        borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
      ),
      child: TextFormField(
        style: TextStyle(color: kBackgroundColor),
        obscureText: widget.isPassword ? _show : false,
        controller: widget.controller,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxline ?? 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          fillColor: kConkgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: kSecondTextColor, fontSize: 15),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _show = !_show;
                    });
                  },
                  child: _show ? Image.asset('assets/icons/eye.png') : Image.asset('assets/icons/eye-slash.png'),
                )
              : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}
