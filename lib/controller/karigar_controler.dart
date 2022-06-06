import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:varni_admin/modals/karigar_models.dart';

import '../strings/strings.dart';

class KarigarDataControler extends GetxController {
  List<KarigarData> karigardatalist = [];

  @override
  void onInit() {
    super.onInit();
    fechproductData();
  }

  fechproductData() async {
    karigardatalist = [];
    var uri = Uri.parse(getKarigarURL);

    Map mapeddate = {};
    http.Response reponse = await http.post(uri, body: mapeddate);
    print("reponse:$reponse");

    //getting response from php code, here

    try {
      var data = await jsonDecode(reponse.body);

      for (var i = 0; i < data.length; i++) {
        karigardatalist.add(KarigarData(
            id: data[i]['id'],
            name: data[i]['name'],
            mobile: data[i]['mobile'],
            pass: data[i]['pass'],
            adr: data[i]['adr'],
            clKey: data[i]['cl_key'],
            logo: data[i]['logo'],
            lockCnt: data[i]['lock_cnt'],
            login: data[i]['login'],
            bhav: data[i]['bhav'],
            job: data[i]['job'],
            date: data[i]['date']));
        print("NAME" + data[i]["name"]);
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  updatelive(String st, String keyP, String keyTYP, String check) async {
    print("ST= $st");
    var uri = Uri.parse(updatePERurl);
    Map mapeddate = {
      'keyTYP': keyTYP.trim(),
      'st': st.trim(),
      'key': keyP.trim(),
      'check': check.trim(),
    };

    http.Response reponse = await http.post(uri, body: mapeddate);
    print(reponse);

    await fechproductData();
    //getting response from php code, here
    try {} catch (e) {
      print(e);
    }
  }
}
