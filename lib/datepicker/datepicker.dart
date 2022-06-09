import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varni_admin/controller/datecontroler.dart';

import '../controller/userdata_controler.dart';
import '../strings/strings.dart';

class Datepicker0 {
  showPicker(BuildContext context, String karigarKeySelect, String keychekar0, bool check) {
    StringContoller dateContoller = Get.put(StringContoller());
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
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
                      Expanded(
                        flex: 2,
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
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                    elevation: 5.0,
                                    color: Color.fromARGB(255, 74, 153, 177),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.green.shade300,
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

                                        await showDialog(
                                          context: context,
                                          builder: (context) => FutureProgressDialog(
                                              userData.getlotCOMPLETE(yearlist[selectedValu] + "-$s1" + "-01", yearlist[selectedValu] + "-$s1" + "-31", karigarKeySelect, keychekar0, true)),
                                        );

                                        Navigator.pop(context, false);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 1.0)],
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0),
                                          ),
                                        ),
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
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                      splashColor: Colors.red.shade300,
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
