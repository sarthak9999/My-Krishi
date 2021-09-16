import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Dataservice extends GetxController {
  var checking = false.obs;

  static const _stroage = FlutterSecureStorage();
  static const _keyuserdetails = 'Userdetails';
  static const _keydetails = 'details';

  Future setusername(Map<String, dynamic> userdetails) async {
    String value = jsonEncode(userdetails);
    await _stroage.write(key: _keyuserdetails, value: value);
  }

  var geetinguser = false.obs;
  var name = ''.obs;
  var email = ''.obs;
  var gender = ''.obs;
  getusername() async {
    try {
      geetinguser(true);
      var value = await _stroage.read(key: _keyuserdetails);
      if (value != null) {
        var details = Map<String, dynamic>.from(json.decode(value));
        print("$details fvhuo");
        name(details['name']);
        email(details['email']);
        gender(details['gender']);
      }
    } catch (e) {
      geetinguser(false);
      print("$e error");
    } finally {
      geetinguser(false);
    }
  }

  Future setdetails(List<dynamic> details) async {
    String value = jsonEncode(details);
    await _stroage.write(key: _keydetails, value: value);
  }

  var mandidetails = [].obs;
  var gettingmandi = false.obs;
  getdetails() async {
    gettingmandi(true);
    try {
      var value = await _stroage.read(key: _keydetails);
      if (value != null) {
        mandidetails((json.decode(value)));
      }
    } catch (e) {
      gettingmandi(false);
    } finally {
      gettingmandi(false);
    }
  }

  logout() async {
    await _stroage.delete(key: _keyuserdetails);
  }

  deletemandi() async {
    await _stroage.delete(key: _keydetails);
  }

  var gettingmandis = false.obs;
  fungetdata() async {
    gettingmandis(true);
    try {
      var response = await http.get(Uri.parse(
          "https://thekrishi.com/test/mandi?lat=28.44108136&lon=77.0526054&ver=89&lang=hi&crop_id=10"));
      var j1 = await json.decode(utf8.decode(response.bodyBytes))['data']
          ['other_mandi'];
      setdetails(j1);
      mandidetails(j1);
      return j1;
    } catch (e) {
      gettingmandis(false);
    } finally {
      gettingmandis(false);
    }
  }
}
