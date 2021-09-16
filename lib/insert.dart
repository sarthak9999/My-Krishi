import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:krishi_app/dataservice.dart';
import 'package:krishi_app/home.dart';

class Ins extends StatefulWidget {
  @override
  _InsState createState() => _InsState();
}

class _InsState extends State<Ins> {
  @override
  void initState() {
    super.initState();
  }

  final Dataservice dsvar = Get.find<Dataservice>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: dsvar.fungetdata(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return Center(
              child: SpinKitCircle(
                color: Colors.orange,
                size: 80,
              ),
            );
          }
        },
      ),
    );
  }
}
