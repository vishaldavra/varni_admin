import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varni_admin/controller/datecontroler.dart';

import '../controller/userdata_controler.dart';
import '../strings/strings.dart';

class Datepicker0 {
  showPicker(BuildContext context, String karigarKeySelect, String keychekar0, bool check) {
    DateContoller dateContoller = Get.put(DateContoller());
    int selectedValu = 0;
    int selectedValu2 = 0;
    UserData userData = Get.put(UserData());
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 43, 103, 122),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 220,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 1, 5, 0),
                        child: Material(
                            elevation: 5.0,
                            color: Color.fromARGB(255, 18, 192, 70),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                            child: InkWell(
                              splashColor: const Color.fromARGB(255, 46, 44, 94),
                              splashFactory: InkSplash.splashFactory,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                              onTap: () async {
                                // month = monthlist[selectedValu2];
                                // year = yearlist[selectedValu];
                                String s1 = "";
                                selectedValu2 += 1;
                                if (selectedValu2 < 10) {
                                  s1 = "0" + selectedValu2.toString();
                                } else {
                                  s1 = selectedValu2.toString();
                                }

                                String dateone = datechanger(yearlist[selectedValu] + "-$s1" + "-01");
                                String datetow = datechanger(yearlist[selectedValu] + "-$s1" + "-31");
                                dateContoller.date1 = dateone.obs;
                                dateContoller.date2 = datetow.obs;
                                dateContoller.update();

                                // setState(() {});
                                // await showDialog(
                                //   context: context,
                                //   builder: (context) => FutureProgressDialog(getlot(context, date1, date2)),
                                // );
                                Navigator.pop(context, false);
                                await userData.getlotCOMPLETE(yearlist[selectedValu] + "-$s1" + "-01", yearlist[selectedValu] + "-$s1" + "-31", karigarKeySelect, keychekar0, true);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 1.0)],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                ),
                                width: 60,
                                height: 20,
                                alignment: Alignment.center,
                                child: Text(
                                  "OK",
                                  style: GoogleFonts.lato(shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ], fontWeight: FontWeight.w800, color: Colors.white, fontSize: 12),
                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 1, 5, 0),
                        child: Material(
                            elevation: 5.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                            child: InkWell(
                              splashColor: const Color.fromARGB(255, 46, 44, 94),
                              splashFactory: InkSplash.splashFactory,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                              onTap: () async {
                                Navigator.pop(context, false);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 1.0)],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                  ),
                                ),
                                width: 60,
                                height: 20,
                                alignment: Alignment.center,
                                child: Text(
                                  "Close",
                                  style: GoogleFonts.lato(shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ], fontWeight: FontWeight.w800, color: Colors.black, fontSize: 12),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: CupertinoPicker(
                          looping: true,
                          onSelectedItemChanged: (value) {
                            selectedValu = value;
                          },
                          itemExtent: 35.0,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "2022",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "2023",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "2024",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "2025",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: CupertinoPicker(
                          looping: true,
                          onSelectedItemChanged: (value) {
                            selectedValu2 = value;
                          },
                          itemExtent: 35.0,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "January",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "February",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "March",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "April",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "May",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "June",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "July",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "August",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "September",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "October",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "November",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "December",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  shadows: const [
                                    Shadow(
                                      blurRadius: 0.5,
                                      color: Colors.black,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
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
