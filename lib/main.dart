import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'MaterialApp.dart';

initServices() async {
  await GetStorage.init();
  await Firebase.initializeApp();
}

void main() async {
  await initServices();

  runApp(MaterialAppMain());
}
