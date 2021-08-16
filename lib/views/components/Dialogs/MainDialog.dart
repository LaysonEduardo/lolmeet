import 'package:flutter/material.dart';
import '../SimpleButton.dart';

// ignore: must_be_immutable
class MainDialog extends StatelessWidget {
  var content;
  var function;
  MainDialog({required this.content, required this.function});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 300,
          child: Container(
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
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF010911),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: content),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FittedBox(
                        child: Row(
                          children: [
                            LoginButton(
                              text: 'Ok',
                              function: function,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
