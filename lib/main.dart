import 'package:flutter/material.dart';
import 'package:krishi_app/dataservice.dart';
import 'package:get/get.dart';
import 'package:krishi_app/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Dataservice dtvl = Get.put(Dataservice());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Krishi App',
      theme: ThemeData(
        fontFamily: 'cv',
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(),
    );
  }
}
