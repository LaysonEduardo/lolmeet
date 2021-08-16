import 'package:flutter/material.dart';
import 'package:lolmeet/core/Fonts.dart';

// ignore: must_be_immutable
class SimpleInput extends StatefulWidget {
  var controller;
  var label;
  var icon;
  SimpleInput({
    required this.controller,
    required this.label,
    required this.icon,
  });
  @override
  _SimpleInputState createState() => _SimpleInputState();
}

class _SimpleInputState extends State<SimpleInput> {
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
            keyboardType: TextInputType.emailAddress,
            enableSuggestions: true,
            style: AppFonts.simpleText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.label,
              hintStyle: AppFonts.inputText,
              prefixIcon: Icon(
                widget.icon,
                color: Color(0xFFC19C50),
              ),
              prefixIconConstraints: BoxConstraints(
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
