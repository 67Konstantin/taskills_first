import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final Color focusColor;
  final Color enabledColor;
  final Color fillColor;
  final bool isPassword;
  final bool isEmail;
  final Color textColor;
  final double borderRadius;
  final TextInputType inputType;
  final Function(String)? onChanged;

  CustomTextField({
    required this.labelText,
    this.focusColor = Colors.white,
    this.enabledColor = const Color.fromARGB(255, 173, 173, 173),
    this.fillColor = Colors.blue,
    this.textColor = Colors.black,
    this.isPassword = false,
    this.isEmail = false,
    this.borderRadius = 100,
    this.inputType = TextInputType.text,
    this.onChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late Color enabledTextField;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    enabledTextField = widget.enabledColor;
  }

  @override
  Widget build(BuildContext context) {
    double textSize = 16;

    return TextField(
      style: TextStyle(
        color: widget.textColor,
        fontSize: textSize,
      ),
      obscureText: _obscureText,
      keyboardType: widget.inputType,
      onChanged: (String value) {
        setState(() {
          if (widget.isPassword && value.length < 8) {
            enabledTextField = Colors.red;
          } else if (widget.isEmail && !_isEmailValid(value)) {
            enabledTextField = Colors.red;
          } else {
            // В противном случае возвращаем исходный цвет
            enabledTextField = widget.enabledColor;
          }
        });
        widget.onChanged?.call(value);
      },
      decoration: InputDecoration(
        focusColor: widget.focusColor,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.focusColor,
          fontSize: textSize,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.9,
        ),
        fillColor: widget.fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledTextField,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        suffixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              )
            : null,
      ),
    );
  }

  bool _isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
