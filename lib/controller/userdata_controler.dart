import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:varni_admin/modals/getLot_models.dart';

import '../modals/karigarPayment._models.dart';
import '../strings/strings.dart';

class UserData extends GetxController {
  List<GetLot> karigardatalist = [];
  List<GetPending> karigardataPendinglist = [];
  List<KarigarPayment> karigarPaymentlist = [];
  @override
  void onInit() {
    super.onInit();
  }

  getlotCOMPLETE(String date1, String date2, String partyKeySelected, String keyTyp, bool getlotST) async {
    print(date1);
    print(date2);
    print(partyKeySelected);
    karigardatalist = [];
    String tebal = "";
    String reportST = "";
    if (keyTyp == "JTC" || keyTyp == "VTC") {
      tebal = "tiching_entry";
      if (getlotST) {
        reportST = "complete";
      } else {
        reportST = "tiching";
      }
    } else if (keyTyp == "VP4P") {
      tebal = "stock";
      if (getlotST) {
        reportST = "f_complete";
      } else {
        reportST = "stock";
      }
    } else {
      tebal = "forpi_entry";
      if (getlotST) {
        reportST = "f_complete";
      } else {
        reportST = "forpi";
      }
    }
    print("=================$partyKeySelected======================$tebal$reportST");

    var uri = Uri.parse(reportAll4PURL);

    Map mapeddate = {
      'karigar_key': partyKeySelected,
      'report_st': reportST,
      'date1': date1,
      'date2': date2,
      'tebal': tebal,
    };
    http.Response reponse = await http.post(uri, body: mapeddate);
    print("getlotCOMPLETE" + reponse.body);

    //getting response from php code, here

    try {
      var data = await jsonDecode(reponse.body);
      // double s3 = 0, mony = 0;
      // double tottalvajan = 0;
      // double tottalmony = 0;
      // int pic = 0;

      // int tottalpic = 0;
      // tottalvajanS = "";
      // tottalpicS = "";
      // tottalmonyS = "";
      for (var i = 0; i < data.length; i++) {
        karigardatalist.add(GetLot(c0: data[i]['c0'], c00: data[i]["c00"], c000: data[i]["c000"], c1: data[i]['c1'], c2: data[i]['c2'], c3: data[i]['c3']));
      }
      update();
      if (reponse.statusCode == 200) {
        await getlotPendin(date1, date2, partyKeySelected, keyTyp);
        await getPayment(partyKeySelected, date1, date2);
      }
      //print("data: $data");
      // var status = data["status"];
      // print("status: $status");

    } catch (e) {
      print(e);
    }
  }

  getlotPendin(String date1, String date2, String partyKeySelected, String keyTyp) async {
    print(date1);
    print(date2);
    print(partyKeySelected);
    karigardataPendinglist = [];
    String tebal = "";
    String reportST = "";
    if (keyTyp == "JTC" || keyTyp == "VTC") {
      tebal = "tiching_entry";

      reportST = "tiching";
    } else if (keyTyp == "VP4P") {
      tebal = "stock";

      reportST = "stock";
    } else {
      tebal = "forpi_entry";

      reportST = "forpi";
    }
    print("=================$partyKeySelected======================$tebal$reportST");

    var uri = Uri.parse(reportAll4PURL);

    Map mapeddate = {
      'karigar_key': partyKeySelected,
      'report_st': reportST,
      'date1': date1,
      'date2': date2,
      'tebal': tebal,
    };
    http.Response reponse = await http.post(uri, body: mapeddate);
    print("getlotCOMPLETE" + reponse.body);

    //getting response from php code, here

    try {
      var data = await jsonDecode(reponse.body);
      // double s3 = 0, mony = 0;
      // double tottalvajan = 0;
      // double tottalmony = 0;
      // int pic = 0;

      // int tottalpic = 0;
      // tottalvajanS = "";
      // tottalpicS = "";
      // tottalmonyS = "";
      for (var i = 0; i < data.length; i++) {
        karigardataPendinglist.add(GetPending(c0: data[i]['c0'], c00: data[i]["c00"], c000: data[i]["c000"], c1: data[i]['c1'], c2: data[i]['c2'], c3: data[i]['c3']));
      }
      update();
      //print("data: $data");
      // var status = data["status"];
      // print("status: $status");

    } catch (e) {
      print(e);
    }
  }

  getPayment(karigarDEPARMENT, date1, date2) async {
    karigarPaymentlist = [];
    var uri = Uri.parse(getPaymentURL);
    print(karigarDEPARMENT);

    Map mapeddate = {
      'cl_key': karigarDEPARMENT.trim(),
      'date1': date1.trim(),
      'date2': date2.trim(),
    };
    http.Response reponse = await http.post(uri, body: mapeddate);
    print("reponse:$reponse");

    try {
      var data = await jsonDecode(reponse.body);
      for (var i = 0; i < data.length; i++) {
        karigarPaymentlist
            .add(KarigarPayment(id: data[i]['id'], name: data[i]["name"], mobile: data[i]["mobile"], amo: data[i]['amo'], clKey: data[i]['clKey'], date: data[i]['date'], time: data[i]['time']));

        // if (amolist.isNotEmpty) {
        //   double tra = double.parse(data[i]["amo"]);

        //   munthTotalTRA = munthTotalTRA + tra;
        //   setState(() {});
        // }
      }
      update();
      if (reponse.statusCode == 200) {
        print("200");
      }

      //print("data: $data");
      // var status = data["status"];
      // print("status: $status");

      print("Trans===" + reponse.body);
    } catch (e) {
      print(e);
    }
  }
}
