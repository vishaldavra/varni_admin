import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:varni_admin/modals/karigar_models.dart';

import '../controller/karigar_controler.dart';
import '../strings/strings.dart';

class KarigarView extends StatefulWidget {
  const KarigarView({Key? key}) : super(key: key);

  @override
  State<KarigarView> createState() => _KarigarViewState();
}

class _KarigarViewState extends State<KarigarView> {
  KarigarDataControler karigarDataControler = Get.put(KarigarDataControler());

  PageController _controller = PageController(initialPage: 0, viewportFraction: 0.8);
  bool screenBool = false;
  int globalINDEX = 0;
  String karigarKeySelect = "";
  String keychekar0 = "";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: screenBool
            ? karigaedata(context)
            : GetBuilder<KarigarDataControler>(builder: ((controller) {
                return RefreshIndicator(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 4.0,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: List.generate(karigarDataControler.karigardatalist.length, (index) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: InkWell(
                                onTap: () async {
                                  setState(() {
                                    karigarKeySelect = karigarDataControler.karigardatalist[index].clKey.toString();
                                    var keychekar;
                                    keychekar = keychecker();
                                    screenBool = true;
                                    globalINDEX = index;

                                    keychekar0 = keychekar[0];
                                  });
                                  // await Get.to(() => UserProfile());
                                },
                                child: Material(
                                  elevation: 1,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 245, 245, 245),
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Material(
                                            borderRadius: BorderRadius.circular(30),
                                            child: SizedBox(
                                              height: 60,
                                              width: 60,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(30),
                                                child: CachedNetworkImage(
                                                  imageUrl: "$imageUrl${karigarDataControler.karigardatalist[index].logo.toString()}",
                                                  imageBuilder: (context, imageProvider) => Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                  placeholder: (context, url) => CircularProgressIndicator(
                                                    color: Color.fromARGB(255, 43, 103, 122),
                                                  ),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            '${karigarDataControler.karigardatalist[index].name.toString()}',
                                            style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                                          ),
                                        ),
                                        Text(
                                          '${karigarDataControler.karigardatalist[index].mobile.toString()}',
                                          style: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  onRefresh: () {
                    return karigarDataControler.fechproductData();
                  },
                );
              })));
  }

  Builder karigaedata(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Builder(builder: (BuildContext context) {
      return Column(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              color: Color.fromARGB(255, 166, 205, 217),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          screenBool = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.arrowshape_turn_up_right,
                          size: 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(45),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl: "$imageUrl${karigarDataControler.karigardatalist[globalINDEX].logo.toString()}",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) => CircularProgressIndicator(
                              color: Color.fromARGB(255, 43, 103, 122),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      '${karigarDataControler.karigardatalist[globalINDEX].name.toString()}',
                      style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Text(
                    '${karigarDataControler.karigardatalist[globalINDEX].job.toString()}',
                    style: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 255, 255, 255)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: // Directly use inside yoru [TabBar]
                DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(40),
                  child: Material(
                    color: Color.fromARGB(255, 166, 205, 217),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                    elevation: 1,
                    child: SizedBox(
                      height: 40,
                      child: TabBar(
                        indicatorColor: Color.fromARGB(255, 255, 255, 255),
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Text(
                            'About',
                            style: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Text(
                            'Pending',
                            style: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Text(
                            'Complete',
                            style: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Text(
                            'Payment',
                            style: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromARGB(207, 255, 255, 255)),
                          ),
                        ],
                        labelColor: Colors.black,
                      ),
                    ),
                  ),
                ),
                // appBar: AppBar(
                //   elevation: 0,
                //   leading: Container(),
                //   automaticallyImplyLeading: false,
                //   backgroundColor: Colors.white,
                //   title: Padding(
                //     padding: EdgeInsets.only(left: 50, right: 50),
                //     child: TabBar(
                //       indicatorColor: Colors.pink[100],
                //       indicatorSize: TabBarIndicatorSize.label,
                //       tabs: [
                //         Tab(text: 'Dogs'),
                //         Tab(text: 'Cats'),
                //       ],
                //       labelColor: Colors.black,
                //     ),
                //   ),
                // ), //appbar
                body: Container(
                  color: Colors.white,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: TabBarView(
                      children: [
                        Center(child: aboutPage(context)),
                        Center(child: Text('DOGS')),
                        Center(child: Text('CATS')),
                        Center(child: Text('CATS')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Expanded(
          //   flex: 4,
          //   child: Material(
          //     color: Colors.white,
          //     child: PageView.custom(
          //       childrenDelegate: SliverChildBuilderDelegate((context, index) {
          //         return Text("home" + index.toString());
          //       }, childCount: 3),
          //     ),
          //   ),
          // ),
        ],
      );
    });
  }

  Builder aboutPage(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return GetBuilder<KarigarDataControler>(builder: ((controller) {
        ScrollController controller = ScrollController();
        return SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          controller: controller,
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
                width: double.infinity,
                child: Material(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 245, 245, 245),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: ImageIcon(
                                      AssetImage("images/mobile.png"),
                                      size: 30,
                                      color: Color.fromARGB(255, 43, 103, 122),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5, top: 10),
                                              child: Text(
                                                'Mobile',
                                                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 43, 103, 122)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5, top: 5),
                                              child: Text(
                                                '${karigarDataControler.karigardatalist[globalINDEX].mobile.toString()}',
                                                style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 0, 0, 0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: ImageIcon(
                                      AssetImage("images/adress.png"),
                                      size: 30,
                                      color: Color.fromARGB(255, 43, 103, 122),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5, top: 10),
                                              child: Text(
                                                'Address',
                                                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 43, 103, 122)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 5),
                                                  child: Text(
                                                    '${karigarDataControler.karigardatalist[globalINDEX].adr.toString()}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                    ),
                                                    overflow: TextOverflow.clip,
                                                  )),
                                            ),
                                            // Text(
                                            //   '401,Nimbark recidency dabholi gam surat.dsfrghsdgksdfbv',
                                            //   style: TextStyle(fontSize: 12),
                                            //   maxLines: 2,
                                            //   overflow: TextOverflow.ellipsis,
                                            // ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: ImageIcon(
                                      AssetImage("images/ondate.png"),
                                      size: 26,
                                      color: Color.fromARGB(255, 43, 103, 122),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5, top: 10),
                                              child: Text(
                                                'Ac Creat Date',
                                                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 43, 103, 122)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 5),
                                                  child: Text(
                                                    '${datechanger(karigarDataControler.karigardatalist[globalINDEX].date.toString())}',
                                                    style: GoogleFonts.lato(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                    ),
                                                    overflow: TextOverflow.clip,
                                                  )),
                                            ),
                                            // Text(
                                            //   '401,Nimbark recidency dabholi gam surat.dsfrghsdgksdfbv',
                                            //   style: TextStyle(fontSize: 12),
                                            //   maxLines: 2,
                                            //   overflow: TextOverflow.ellipsis,
                                            // ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 245, 245, 245),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      var keycheck = keychecker();

                                      if (karigarDataControler.karigardatalist[globalINDEX].login.toString() == "1") {
                                        await showDialog(context: context, builder: (context) => FutureProgressDialog(karigarDataControler.updatelive("0", karigarKeySelect, keycheck[0], 'login')));
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (context) => FutureProgressDialog(karigarDataControler.updatelive("1", karigarKeySelect, keycheck[0], 'login')),
                                        );
                                      }
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: ImageIcon(
                                          AssetImage("images/dot.png"),
                                          size: 18,
                                          color: karigarDataControler.karigardatalist[globalINDEX].login.toString() == "0" ? Colors.green.shade400 : Colors.red.shade400,
                                        )),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5, top: 10),
                                              child: Text(
                                                'Last Status',
                                                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 43, 103, 122)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5, top: 5),
                                              child: Text(
                                                karigarDataControler.karigardatalist[globalINDEX].login.toString() == "0" ? "User Online" : "User Logout",
                                                style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 0, 0, 0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      var keycheck = keychecker();

                                      if (karigarDataControler.karigardatalist[globalINDEX].lockCnt.toString() == "1") {
                                        await showDialog(context: context, builder: (context) => FutureProgressDialog(karigarDataControler.updatelive("0", karigarKeySelect, keycheck[0], 'lock')));
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (context) => FutureProgressDialog(karigarDataControler.updatelive("1", karigarKeySelect, keycheck[0], 'lock')),
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: karigarDataControler.karigardatalist[globalINDEX].lockCnt.toString() == "0"
                                          ? ImageIcon(
                                              AssetImage("images/unlock.png"),
                                              size: 30,
                                              color: Colors.green.shade400,
                                            )
                                          : ImageIcon(
                                              AssetImage("images/lock.png"),
                                              size: 30,
                                              color: Colors.red.shade400,
                                            ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5, top: 10),
                                              child: Text(
                                                'Permission',
                                                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 43, 103, 122)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 5),
                                                  child: Text(
                                                    karigarDataControler.karigardatalist[globalINDEX].lockCnt.toString() == "0" ? "Account Unlocked" : "Account Locked",
                                                    style: GoogleFonts.lato(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                    ),
                                                    overflow: TextOverflow.clip,
                                                  )),
                                            ),
                                            // Text(
                                            //   '401,Nimbark recidency dabholi gam surat.dsfrghsdgksdfbv',
                                            //   style: TextStyle(fontSize: 12),
                                            //   maxLines: 2,
                                            //   overflow: TextOverflow.ellipsis,
                                            // ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: CupertinoSwitch(
                                    value: karigarDataControler.karigardatalist[globalINDEX].lockCnt.toString() == "0" ? true : false,
                                    onChanged: (value) async {
                                      var keycheck = keychecker();

                                      if (karigarDataControler.karigardatalist[globalINDEX].lockCnt.toString() == "1") {
                                        await showDialog(context: context, builder: (context) => FutureProgressDialog(karigarDataControler.updatelive("0", karigarKeySelect, keycheck[0], 'lock')));
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (context) => FutureProgressDialog(karigarDataControler.updatelive("1", karigarKeySelect, keycheck[0], 'lock')),
                                        );
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }));
    });
  }

  keychecker() {
    String key0;
    var parts;
    var v1, v2, v3;
    parts = karigarKeySelect.split('-');
    v1 = parts[0].trim();
    v2 = parts[1].trim();
    v3 = parts[2].trim();
    print(v2);
    key0 = v2;
    String tebal = "";
    if (key0 == "JTC" || key0 == "VTC") {
      tebal = "tiching_entry";
    } else if (key0 == "VP4P") {
      tebal = "entry";
    } else {
      //JP4P
      tebal = "forpi_entry";
    }
    return [key0, tebal];
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

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}