import 'package:flutter/material.dart';
import 'package:lolmeet/core/Fonts.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  var text;
  var function;

  LoginButton({
    required this.text,
    required this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.8,
          ],
          colors: [
            Color(0xFF08A9A8),
            Color(0xFF01668A),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          color: Color(0xFF1E2328),
          child: MaterialButton(
            onPressed: function,
            child: Text(
              text,
              style: AppFonts.simpleText,
            ),
          ),
        ),
      ),
    );
  }
}
