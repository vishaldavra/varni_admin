import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varni_admin/controller/datecontroler.dart';

import '../controller/userdata_controler.dart';

class KarigarPendingView extends StatelessWidget {
  UserData userData = Get.put(UserData());
  StringContoller stringContoller = Get.put(StringContoller());
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserData>(builder: ((controller) {
      return userData.karigardataPendinglist.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: userData.karigardataPendinglist.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 6),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 30),
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: 30,
                      verticalOffset: 30.0,
                      child: FlipAnimation(
                          duration: Duration(milliseconds: 30),
                          curve: Curves.fastLinearToSlowEaseIn,
                          flipAxis: FlipAxis.x,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Material(
                                animationDuration: const Duration(milliseconds: 200),
                                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                elevation: 1,
                                color: Color.fromARGB(255, 245, 245, 245),
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        if (stringContoller.keyTYP == "JP4P" || stringContoller.keyTYP == "JTC" || stringContoller.keyTYP == "VP4P") ...[
                                          Text(
                                            userData.karigardataPendinglist[index].c00.toString(),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                          Text(
                                            userData.karigardataPendinglist[index].c000.toString(),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                          Text(
                                            userData.karigardataPendinglist[index].c2.toString(),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                          Text(
                                            datechanger(userData.karigardataPendinglist[index].c3.toString()),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                        ] else ...[
                                          Text(
                                            userData.karigardataPendinglist[index].c0.toString(),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                          Text(
                                            userData.karigardataPendinglist[index].c1.toString(),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                          Text(
                                            userData.karigardataPendinglist[index].c2.toString(),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                          Text(
                                            datechanger(userData.karigardataPendinglist[index].c3.toString()),
                                            style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ));
              })
          : Container();
    }));
  }

  datechanger(date) {
    var parts;
    var v1, v2, v3;
    parts = date.split('-');
    v1 = parts[0].trim();
    v2 = parts[1].trim();
    v3 = parts[2].trim();

    date = v3 + "/" + v2 + "/" + v1;
    return date;
  }
}
