import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:krishi_app/animations.dart';
import 'package:krishi_app/checkdata.dart';
import 'package:krishi_app/dataservice.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
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

  funsnack(title, desc, Color c1, IconData i1, isize, to, bo, le, ri) {
    var pw = Get.size.width;
    return Get.snackbar(
      '',
      "",
      titleText: Text(title.toString(),
          style: TextStyle(
              fontFamily: 'cv',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: w(19, pw))),
      messageText: Text(desc.toString().capitalizeFirst,
          style: TextStyle(
              fontFamily: "cv", fontSize: w(16, pw), color: Colors.white)),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(bottom: bo, left: le, right: ri, top: to),
      icon: Icon(
        i1,
        color: Colors.white,
        size: isize,
      ),
      backgroundColor: c1,
      shouldIconPulse: false,
      duration: const Duration(milliseconds: 1800),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      changestyle();
    });
    _name.text = dsvar.name.toString();
    _email.text = dsvar.email.toString();
    slectedgender = dsvar.gender.toString();
    dsvar.name.toString().length == 0 ? isagree = false : isagree = true;
  }

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  String slectedgender = "";
  bool selected = true;
  double iconsize = 5;
  bool isagree = false;

  @override
  Widget build(BuildContext context) {
    var pw = Get.size.width;
    var ph = Get.size.height;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          _sta(),
          SizedBox(
            height: h(10, ph),
          ),
          _anitext(1.7, "Create Account", 2100, 5.0, 28.0,
              Colors.black.withOpacity(0.7), FontWeight.bold),
          _anitext(1.8, "Sign up to continue", 1800, 5.0, 14.0, Colors.black,
              FontWeight.w400),
          SizedBox(
            height: h(30, ph),
          ),
          _textfeild(
              1.9, 'Name    (Gram Singh)', Icons.person, Colors.blue, _name, 0),
          SizedBox(
            height: h(30, ph),
          ),
          _textfeild(2.1, 'E-mail  (abc@gmail.com) ', Icons.email_rounded,
              Colors.red, _email, 2),
          SizedBox(
            height: h(30, ph),
          ),
          _gender(),
          SizedBox(
            height: h(30, ph),
          ),
          _term(),
          SizedBox(
            height: h(30, ph),
          ),
          _signrow(),
          SizedBox(
            height: h(30, ph),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w(30, pw)),
            child: Text(
              "Know more about us at ->",
              style: TextStyle(
                  fontSize: w(19, pw),
                  color: Colors.black.withOpacity(0.45),
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: h(10, ph),
          ),
          _iconrow(),
          SizedBox(
            height: h(100, ph),
          ),
        ],
      ),
    );
  }

  Widget _gender() {
    var pw = Get.size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(30, pw)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeAnimation(
            2.2,
            Text(
              "Gender",
              style: TextStyle(
                  shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 3,
                        offset: Offset(3, 3))
                  ],
                  fontSize: w(22, pw),
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold),
            ),
          ),
          FadeAnimation(
            2.3,
            Row(
              children: [
                _gi("Male", Colors.blue),
                SizedBox(
                  width: w(40, pw),
                ),
                _gi("Female", Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _gi(te, col) {
    var pw = Get.size.width;
    var ph = Get.size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          slectedgender = te;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: slectedgender == te ? col : Colors.white,
          boxShadow: [
            BoxShadow(
                color: col.withOpacity(0.2),
                blurRadius: 3,
                offset: Offset(3, 3))
          ],
        ),
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w(8, pw), vertical: h(5, ph)),
            child: Text(
              "$te",
              style: TextStyle(
                  fontSize: w(20, pw),
                  fontWeight: FontWeight.bold,
                  color: slectedgender == te ? Colors.white : col),
            ),
          ),
        ),
      ),
    );
  }

  changestyle() {
    var pw = Get.size.width;
    setState(() {
      iconsize = iconsize == 5 ? w(32, pw) : w(5, pw);
      selected = !selected;
    });
  }

  Widget _iconrow() {
    var pw = Get.size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(30, pw)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _ixc(FontAwesomeIcons.facebookF, Colors.blue, 22.0),
          SizedBox(
            width: 8,
          ),
          _ixc(FontAwesomeIcons.instagram, Colors.pinkAccent, 22.0),
          SizedBox(
            width: w(8, pw),
          ),
          _ixc(FontAwesomeIcons.github, Colors.black, 22.0),
          SizedBox(
            width: w(8, pw),
          ),
          _ixc(FontAwesomeIcons.linkedin, Colors.blue, 22.0),
          SizedBox(
            width: w(8, pw),
          ),
          _ixc(FontAwesomeIcons.youtube, Colors.redAccent, 22.0),
        ],
      ),
    );
  }

  Widget _ixc(i1, c1, si) {
    var pw = Get.size.width;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: c1),
      child: Padding(
        padding: EdgeInsets.all(w(8.0, pw)),
        child: Center(
          child: Icon(
            i1,
            size: w(si, pw),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _signrow() {
    var pw = Get.size.width;
    var ph = Get.size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(30, pw)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dsvar.name.toString().length == 0 ? "Sign up" : "Login",
            style: TextStyle(
                shadows: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 3,
                      offset: Offset(3, 3))
                ],
                fontSize: 23,
                color: Colors.black.withOpacity(0.9),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () async {
              if (_name.text.isEmpty) {
                funsnack(
                    "Error Occurred",
                    "Name can not be empty",
                    Colors.redAccent,
                    Icons.info_outline,
                    30.0,
                    0.0,
                    20.0,
                    10.0,
                    10.0);
              } else if (_email.text.isEmpty) {
                funsnack(
                    "Error Occurred",
                    "Email can not be empty",
                    Colors.redAccent,
                    Icons.info_outline,
                    30.0,
                    0.0,
                    20.0,
                    10.0,
                    10.0);
              } else if (!_email.text.isEmail) {
                funsnack(
                    "Error Occurred",
                    "Enter valid email",
                    Colors.redAccent,
                    Icons.info_outline,
                    30.0,
                    0.0,
                    20.0,
                    10.0,
                    10.0);
              } else if (slectedgender.isEmpty) {
                funsnack(
                    "Error Occurred",
                    "Gender can not be unselected",
                    Colors.redAccent,
                    Icons.info_outline,
                    30.0,
                    0.0,
                    20.0,
                    10.0,
                    10.0);
              } else if (!isagree) {
                funsnack(
                    "Error Occurred",
                    "Please agree to terms and conditions",
                    Colors.redAccent,
                    Icons.info_outline,
                    30.0,
                    0.0,
                    20.0,
                    10.0,
                    10.0);
              } else {
                dsvar.name(_name.text);
                dsvar.email(_email.text);
                dsvar.gender(slectedgender);
                await dsvar.setusername({
                  'name': _name.text,
                  'email': _email.text,
                  'gender': slectedgender,
                }).whenComplete(() {
                  Get.to(() => C());
                });
              }
            },
            child: Container(
              width: w(70, pw),
              height: h(36, ph),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _term() {
    var pw = Get.size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(30, pw)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  isagree = !isagree;
                });
              },
              child: !isagree
                  ? Icon(
                      Icons.check_box_outline_blank,
                      size: w(28, pw),
                      color: Colors.black.withOpacity(0.7),
                    )
                  : Icon(
                      Icons.check_box,
                      size: w(28, pw),
                      color: Colors.green,
                    )),
          Text(
            " I agree to",
            style: TextStyle(
                color: Colors.black.withOpacity(0.6), fontSize: w(17, pw)),
          ),
          Text(
            "Terms & conditions",
            style: TextStyle(
                color: Colors.green.withOpacity(1), fontSize: w(17, pw)),
          ),
        ],
      ),
    );
  }

  Widget _textfeild(anival, ht, ic, c1, TextEditingController val, i1) {
    var pw = Get.size.width;
    var ph = Get.size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: w(20, pw),
      ),
      child: Row(
        children: [
          FadeAnimation(
            anival,
            Neumorphic(
              style: NeumorphicStyle(
                  shadowDarkColor: Colors.green.withOpacity(0.45),
                  shape: NeumorphicShape.flat,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(3)),
                  depth: h(18, ph),
                  lightSource: LightSource.topLeft,
                  color: Colors.white),
              child: Container(
                height: h(49, ph),
                width: w(245, pw),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w(20, pw)),
                  child: TextField(
                    keyboardType: i1 == 0
                        ? TextInputType.name
                        : i1 == 1
                            ? TextInputType.number
                            : TextInputType.emailAddress,
                    controller: val,
                    cursorColor: Colors.green.withOpacity(0.7),
                    decoration: InputDecoration(hintText: ht),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: w(15, pw),
          ),
          _icon(ic, c1, val),
        ],
      ),
    );
  }

  Widget _icon(ic, c1, TextEditingController val) {
    var pw = Get.size.width;
    var ph = Get.size.height;
    return Neumorphic(
      style: NeumorphicStyle(
          shadowDarkColor: Colors.green.withOpacity(0.45),
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(3)),
          depth: h(18, ph),
          lightSource: LightSource.topLeft,
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(w(8.0, pw)),
        child: AnimatedSize(
          duration: Duration(milliseconds: 1200),
          vsync: this,
          child: Center(
              child: Icon(
            ic,
            size: iconsize,
            color: c1,
          )),
        ),
      ),
    );
  }

  Widget _anitext(anival, te, ti, fs1, fs2, tc, fw) {
    var pw = Get.size.width;
    return Center(
      child: FadeAnimation(
        anival,
        Text(
          '$te',
          style: TextStyle(
              fontFamily: 'cv',
              shadows: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 3,
                    offset: Offset(3, 3))
              ],
              fontSize: w(fs2, pw),
              color: tc,
              fontWeight: fw),
        ),
      ),
    );
  }

  Widget _sta() {
    var ph = Get.size.height;
    return Stack(
      children: [
        ClipPath(
          clipper: Cont1(),
          child: Container(
            height: h(300, ph),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.greenAccent.withOpacity(0.3)
                ])),
          ),
        ),
        ClipPath(
          clipper: Cont2(),
          child: Container(
            height: h(300, ph),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.green.withOpacity(0.35),
                  Colors.greenAccent.withOpacity(0.35),
                ])),
          ),
        ),
        ClipPath(
          clipper: Cont3(),
          child: Container(
            height: h(300, ph),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.green.withOpacity(0.45),
                  Colors.greenAccent.withOpacity(0.45),
                ])),
          ),
        ),
        ClipPath(
          clipper: Cont4(),
          child: Container(
            height: h(300, ph),
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Colors.green.withOpacity(0.6),
                  Colors.greenAccent.withOpacity(0.6),
                ])),
          ),
        ),
        Container(
          height: h(300, ph),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h(100, ph),
              ),
              _anitext(1.5, "Krishi Kripa", 2100, 10.0, 35.0, Colors.white,
                  FontWeight.bold),
              _anitext(1.6, "Empowering Farmers", 1500, 10.0, 28.0,
                  Colors.white, FontWeight.bold),
            ],
          ),
        )
      ],
    );
  }
}

class Cont1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0.55 * size.height);
    path.quadraticBezierTo(
        0, 0.95 * size.height, 0.465 * size.height, 0.95 * size.height);
    path.quadraticBezierTo(
        0.98 * size.height, 0.95 * size.height, size.width, 0.35 * size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Cont2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.7 * size.height, 0);
    path.quadraticBezierTo(0.465 * size.height, 0.25 * size.height,
        0.465 * size.height, 0.5 * size.height);
    path.quadraticBezierTo(
        0.465 * size.height, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Cont3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0.55 * size.height, size.height, size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Cont4 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.25 * size.height, 0);
    path.quadraticBezierTo(0.25 * size.height, 0.675 * size.height, size.width,
        0.675 * size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
