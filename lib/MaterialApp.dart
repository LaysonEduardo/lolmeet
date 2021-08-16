import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lolmeet/views/screens/LoginScreen.dart';

import 'core/Colors.dart';

class MaterialAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: AppColors.primary,
          accentColor: AppColors.secondary,
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.primary,
          accentColor: AppColors.secondary,
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
          ),
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
