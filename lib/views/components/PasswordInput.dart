import 'package:flutter/material.dart';
import 'package:lolmeet/core/Fonts.dart';

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  var controller;
  var isPassword = true;
  var label;
  PasswordInput({required this.controller, required this.label});
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool boolPassword = true;
  var passwordWidget;

  @override
  void initState() {
    super.initState();
    if (widget.isPassword == true) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.8,
          ],
          colors: [
            Color(0xFFC19C50),
            Color(0xFF423A27),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF010911),
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.streetAddress,
            enableSuggestions: true,
            obscureText: boolPassword,
            style: AppFonts.inputText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.label,
              hintStyle: AppFonts.inputText,
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFC19C50),
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 35,
                minHeight: 35,
                maxWidth: 50,
                minWidth: 50,
              ),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          boolPassword = !boolPassword;
                        });
                      },
                      child: Icon(
                        boolPassword
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Color(0xFFC19C50),
                      ),
                    )
                  : null,
              suffixIconConstraints: BoxConstraints(
                maxHeight: 35,
                minHeight: 35,
                maxWidth: 50,
                minWidth: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
