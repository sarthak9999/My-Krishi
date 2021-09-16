import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:krishi_app/dataservice.dart';
import 'package:krishi_app/login.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Dataservice dsvar = Get.find<Dataservice>();

  w(v1, pw) {
    return ind(pw * (v1 / 360));
  }

  h(v1, ph) {
    return ind(ph * (v1 / 760));
  }

  ind(n) {
    int i1 = n.toString().indexOf('.');
    return double.parse(n.toString().substring(0, i1));
  }

  @override
  Widget build(BuildContext context) {
    var pw = Get.size.width;
    var ph = Get.size.height;
    return Obx(() {
      if (dsvar.gettingmandi.value) {
        return Center(
          child: SpinKitCircle(
            color: Colors.orange,
            size: w(30, pw),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 0,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            toolbarHeight: h(120, ph),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w(16, pw), vertical: h(16, ph)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shadowDarkColor: Colors.green.withOpacity(0.45),
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.circle(),
                                depth: 18,
                                lightSource: LightSource.topLeft,
                                color: Colors.white),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.blue,
                                size: w(30, pw),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(left: w(8, pw)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi! ${dsvar.name}",
                              style: TextStyle(
                                  fontSize: w(20, pw),
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${dsvar.email}",
                              style: TextStyle(
                                  fontSize: w(17, pw),
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w(16, pw), vertical: h(16, ph)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GestureDetector(
                            onTap: () async {
                              dsvar.name('');
                              dsvar.email('');
                              dsvar.gender('');
                              await dsvar.deletemandi();
                              await dsvar.logout().whenComplete(() {
                                Get.offAll(() => Login());
                              });
                            },
                            child: Neumorphic(
                              style: NeumorphicStyle(
                                  shadowDarkColor:
                                      Colors.redAccent.withOpacity(0.45),
                                  shape: NeumorphicShape.concave,
                                  boxShape: NeumorphicBoxShape.circle(),
                                  depth: 18,
                                  lightSource: LightSource.topLeft,
                                  color: Colors.white),
                              child: Center(
                                child: Icon(
                                  Icons.settings_power_outlined,
                                  color: Colors.redAccent,
                                  size: w(30, pw),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: w(80, pw),
                  ),
                  child: Text(
                    "Previous Visits of Mandi",
                    style: TextStyle(
                        fontSize: w(18, pw),
                        color: Colors.orange.withOpacity(1),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          body: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    margin: EdgeInsets.all(w(20, pw)),
                    child: Stack(
                      children: [
                        ClipPath(
                          clipper: CurveClipper(),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/farms.png'),
                                    fit: BoxFit.fill),
                                color: Colors.orange.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8)),
                            height: h(270, ph),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: w(20, pw)),
                          height: h(350, ph),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h(215, ph),
                              ),
                              Center(
                                  child: Text(
                                "${dsvar.mandidetails[index]['market']}",
                                style: TextStyle(
                                    fontSize: w(22, pw),
                                    color: Colors.black.withOpacity(0.8),
                                    fontWeight: FontWeight.bold),
                              )),
                              SizedBox(
                                height: h(7, ph),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.double_arrow_rounded,
                                      size: w(22, pw), color: Colors.indigo),
                                  Text(
                                    " ${dsvar.mandidetails[index]['state']}",
                                    style: TextStyle(
                                        fontSize: w(18, pw),
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: w(70, pw),
                                  ),
                                  Icon(Icons.double_arrow_rounded,
                                      size: w(22, pw), color: Colors.indigo),
                                  Text(
                                    "${dsvar.mandidetails[index]['district']} (${dsvar.mandidetails[index]['district_id']})",
                                    style: TextStyle(
                                        fontSize: w(18, pw),
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h(4, ph),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.double_arrow_rounded,
                                      size: w(22, pw), color: Colors.indigo),
                                  Text(
                                    " Last visit :  ${dsvar.mandidetails[index]['last_date']}",
                                    style: TextStyle(
                                        fontSize: w(17, pw),
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h(4, ph),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.double_arrow_rounded,
                                      size: w(22, pw), color: Colors.indigo),
                                  Text(
                                    " Distance :  ${dsvar.mandidetails[index]['km']} km",
                                    style: TextStyle(
                                        fontSize: w(17, pw),
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              },
              itemCount: dsvar.mandidetails.length),
        );
      }
    });
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        0, (3 * size.height) / 4, (size.width) / 3, (3 * size.height) / 4);
    path.lineTo((2 * size.width) / 3, (3 * size.height) / 4);
    path.quadraticBezierTo(
        size.width, (3 * size.height) / 4, size.width, (3 * size.height) / 7);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
