import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/karigar_controler.dart';
import '../controller/userdata_controler.dart';

class KarigarPayVIew extends StatelessWidget {
  UserData userData = Get.put(UserData());
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserData>(builder: ((controller) {
      return userData.karigarPaymentlist.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: userData.karigarPaymentlist.length,
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "\u{20B9}" + userData.karigarPaymentlist[index].amo.toString(),
                                          style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              datechanger(userData.karigarPaymentlist[index].date.toString()),
                                              style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 13),
                                            ),
                                            Text(
                                              userData.karigarPaymentlist[index].time.toString(),
                                              style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Color.fromARGB(255, 114, 112, 112), fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
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
