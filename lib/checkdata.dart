import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:krishi_app/dataservice.dart';
import 'package:krishi_app/home.dart';
import 'package:krishi_app/insert.dart';

class C extends StatefulWidget {
  @override
  _CState createState() => _CState();
}

class _CState extends State<C> {
  @override
  void initState() {
    super.initState();
    dsvar.gettingmandi(true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dsvar.getdetails();
    });
  }

  final Dataservice dsvar = Get.find<Dataservice>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dsvar.gettingmandi.value) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SpinKitCircle(
              color: Colors.blue,
              size: 80,
            ),
          ),
        );
      } else {
        print(dsvar.mandidetails);
        if (dsvar.mandidetails.length == 0) {
          return Ins();
        } else {
          return Home();
        }
      }
    });
  }
}
