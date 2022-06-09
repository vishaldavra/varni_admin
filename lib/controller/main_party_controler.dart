import 'dart:convert';

import 'package:get/get.dart';
import 'package:varni_admin/modals/main_party_model.dart';
import 'package:http/http.dart' as http;

import '../strings/strings.dart';

class MainPartyControler extends GetxController {
  List<MainPartyModels> mainkarigarList = [];

  @override
  void onInit() {
    super.onInit();
    getmainKarigar();
  }

  getmainKarigar() async {
    mainkarigarList.clear();

    var uri = Uri.parse(getParyURL);

    http.Response reponse = await http.post(uri);
    print("reponse:$reponse");

    //getting response from php code, here
    // print(reponse.body);
    try {
      if (reponse.statusCode == 200) {
        var data = await jsonDecode(reponse.body);

        for (var i = 0; i < data.length; i++) {
          mainkarigarList.add(MainPartyModels(
              name: data[i]["name"],
              logo: "user.jpg",
              company: data[i]["company"],
              pKey: data[i]["p_key"],
              mobile: data[i]["mobile"],
              nSmall: data[i]["n_small"],
              nBig: data[i]["n_big"],
              gSmall: data[i]["g_small"],
              gBig: data[i]["g_big"],
              st: data[i]["st"],
              address: data[i]["address"]));
          // }

        }
        update();
      }
      print(mainkarigarList[0].pKey);
      //print("data: $data");
      // var status = data["status"];
      // print("status: $status");

    } catch (e) {
      print(e);
    }
  }
}
