import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiosaphir/pages/home/home_view.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radio Saphir',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Center(
        child: CircularProgressIndicator(backgroundColor: Colors.blueGrey,)
      ),
    );
  }
}