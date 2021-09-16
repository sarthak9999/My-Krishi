import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krishi_app/dataservice.dart';
import 'package:krishi_app/login.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final Dataservice dsvar = Get.find<Dataservice>();

  @override
  void initState() {
    super.initState();
    dsvar.getusername();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dsvar.geetinguser.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Login();
      }
    });
  }
}
