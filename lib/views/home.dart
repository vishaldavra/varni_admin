import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:varni_admin/views/karigarview.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final String title = "";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isCollapsed = false;
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Future<bool> _onWillPop() async {
    return popView
        ? false
        : (await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: new Text('Yes'),
                  ),
                ],
              ),
            )) ??
            false;
  }

  TextEditingController picT = TextEditingController();
  TextEditingController vajanT = TextEditingController();

  String titleSet = "";

  bool uploadCHECK = false;
  bool progres = true;
  bool popView = false;
  @override
  void initState() {
    super.initState();
  }

  int a1 = 0;
  bool closer = false;
  bool incCheck = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (Myapp.st == "NO_NET") {
      incCheck = false;
      if (a1 == 0) {
        showError();
      }
      a1 = 1;
      setState(() {});
    } else {
      incCheck = true;
      if (closer) {
        a1 = 0;
        closer = false;
        Navigator.of(context).pop(null);
        setState(() {});
      }
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.black.withBlue(50), //i like transaparent :-)

          statusBarIconBrightness: Brightness.light, // status bar icons' color
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 43, 103, 122),
            leading: Builder(
              builder: (BuildContext context) {
                return InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ImageIcon(
                      AssetImage("images/varniDD.png"),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
                // return IconButton(
                //   icon: const Icon(
                //     Icons.remove_red_eye_sharp,
                //   ),
                //   onPressed: () {
                //     Scaffold.of(context).openDrawer();
                //   },
                //   tooltip:
                //       MaterialLocalizations.of(context).openAppDrawerTooltip,
                // );
              },
            ),

            toolbarHeight: 40,
            // actions: <Widget>[
            //   InkWell(
            //     onTap: () {
            //       Constents.prefs.setString("pin_st", "1");
            //       Navigator.pushReplacementNamed(context, MyRoutes.pinRoutes);
            //     },
            //     child: Container(
            //       decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            //         BoxShadow(
            //           color: Colors.green,
            //           blurRadius: 5.0,
            //         ),
            //       ]),
            //       width: 35,
            //       child: Icon(
            //         Icons.lock_open_outlined,
            //         color: Colors.white,
            //         size: 20,
            //       ),
            //     ),
            //   ),
            // ],
            title: Text(
              titleSet,
              style: GoogleFonts.lato(fontWeight: FontWeight.w700, color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: _keyboardIsVisible() ? 0.0 : 60,
            items: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: ImageIcon(
                  AssetImage("images/home.png"),
                  color: _page == 0 ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 215, 181, 109),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: ImageIcon(
                  AssetImage("images/user.png"),
                  color: _page == 1 ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 215, 181, 109),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: ImageIcon(
                  AssetImage("images/workdone.png"),
                  color: _page == 2 ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 215, 181, 109),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: ImageIcon(
                  AssetImage("images/stock.png"),
                  color: _page == 3 ? Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 215, 181, 109),
                ),
              ),
            ],
            color: Color.fromARGB(255, 245, 245, 245),
            buttonBackgroundColor: Color.fromARGB(255, 43, 103, 122),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) {
              setState(() {
                _page = index;
                if (index == 1) {
                  titleSet = "Running";
                } else if (index == 2) {
                  titleSet = "Complete";
                } else if (index == 3) {
                  titleSet = "Stock List";
                } else {
                  titleSet = "";
                }
              });
            },
            letIndexChange: (index) => true,
          ),
          drawer: Drawer(
            backgroundColor: Color.fromARGB(255, 247, 247, 247).withOpacity(0.95),
            child: Container(
              // color: const Color.fromARGB(255, 247, 247, 247),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          color: Color.fromARGB(255, 0, 0, 0).withBlue(50),
                          width: double.infinity,
                          height: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(50)), // Set rounded corner radius
                                  boxShadow: [BoxShadow(blurRadius: 10, color: Color.fromARGB(255, 215, 181, 109), offset: Offset(1, 1))],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: FadeInImage(
                                        height: 60,
                                        width: 60,
                                        fadeInDuration: const Duration(milliseconds: 500),
                                        placeholder: AssetImage("images/hanumanji.png"),
                                        image: AssetImage("images/hanumanji.png"),
                                        imageErrorBuilder: (context, error, stackTrace) {
                                          return Container(child: Image.asset("images/hanumanji.png"));
                                        },
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(2.0),
                              //   child: Text(
                              //     karigarNAME,
                              //     style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18, fontWeight: FontWeight.w600),
                              //   ),
                              // ),
                              // Text(
                              //   mobile,
                              //   style: const TextStyle(color: Color.fromARGB(255, 245, 245, 245), fontSize: 13, fontWeight: FontWeight.w400),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
                          child: Material(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.black.withBlue(50),
                            elevation: 2,
                            child: InkWell(
                              onTap: () {
                                Future.delayed(const Duration(milliseconds: 300), () {
                                  setState(() async {
                                    //   await Navigator.popAndPushNamed(context, MyRoutes.reportslist);
                                  });
                                });
                              },
                              child: SizedBox(
                                height: 40,
                                width: 50,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ImageIcon(
                                      AssetImage("images/hanumanji.png"),
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      "Reports",
                                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
                          child: Material(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.black.withBlue(50),
                            elevation: 2,
                            child: InkWell(
                              onTap: () async {
                                Future.delayed(const Duration(milliseconds: 300), () {
                                  setState(() {});
                                });
                              },
                              child: SizedBox(
                                height: 40,
                                width: 50,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ImageIcon(
                                      AssetImage("images/hanumanji.png"),
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Text(
                                      "Mail",
                                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
                          child: Material(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.black.withBlue(50),
                            elevation: 2,
                            child: InkWell(
                              onTap: () async {
                                Future.delayed(const Duration(milliseconds: 300), () {
                                  setState(() {});
                                });
                              },
                              child: SizedBox(
                                height: 40,
                                width: 50,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      CupertinoIcons.info,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      "About",
                                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
                          child: Material(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                            color: Colors.black.withBlue(50),
                            elevation: 2,
                            child: InkWell(
                              onTap: () async {
                                Future.delayed(const Duration(milliseconds: 300), () {
                                  setState(() {});
                                });
                              },
                              child: SizedBox(
                                height: 40,
                                width: 50,
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ImageIcon(
                                      AssetImage("images/hanumanji.png"),
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      "Settings",
                                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 40,
                    child: Material(
                      color: Colors.black.withBlue(50),
                      elevation: 2,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                      child: InkWell(
                        onTap: () async {
                          //  await showDialog(context: context, builder: (context) => FutureProgressDialog(logOUT(context)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CupertinoIcons.power, color: Colors.red),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: Color.fromARGB(255, 247, 247, 247),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          "images/hanumanji.png",
                        ),
                        opacity: 0.5,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: _page == 0
                        ? homeshow()
                        : _page == 1
                            ? KarigarView()
                            : _page == 2
                                ? homeshow()
                                : _page == 3
                                    ? homeshow()
                                    : homeshow()),

                // AnimatedContainer(
                //   duration: Duration(milliseconds: 150),
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height,
                //   color: popView ? Colors.black54 : Colors.transparent,
                //   child: Column(
                //     mainAxisAlignment: _keyboardIsVisible()
                //         ? MainAxisAlignment.start
                //         : MainAxisAlignment.center,
                //     children: [
                //       Container(height: _keyboardIsVisible() ? 55 : 0),
                //       Visibility(
                //         visible: popView,
                //         child: Container(
                //           height: 280,
                //           width: 260,
                //           decoration: const BoxDecoration(
                //             color: Color.fromARGB(255, 247, 247, 247),
                //             borderRadius: BorderRadius.all(Radius.circular(3)),
                //             boxShadow: [
                //               BoxShadow(
                //                 blurRadius: 5,
                //                 spreadRadius: 0.2,
                //               ),
                //             ],
                //           ),
                //           child: Material(
                //             child: SizedBox.expand(
                //                 child: Container(
                //               decoration: const BoxDecoration(
                //                 color: Color.fromARGB(255, 247, 247, 247),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(3)),
                //                 boxShadow: [
                //                   BoxShadow(
                //                     blurRadius: 5,
                //                     spreadRadius: 0.2,
                //                   ),
                //                 ],
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: <Widget>[
                //                   Container(
                //                     width: double.infinity,
                //                     height: 35,
                //                     decoration: const BoxDecoration(
                //                         borderRadius: BorderRadius.only(
                //                           bottomLeft: Radius.circular(10.0),
                //                           bottomRight: Radius.circular(10.0),
                //                         ),
                //                         boxShadow: [
                //                           BoxShadow(
                //                             spreadRadius: 0.5,
                //                             blurRadius: 1.0,
                //                             color: Colors.black,
                //                             offset: Offset(0.0, 1.1),
                //                           ),
                //                         ],
                //                         gradient: LinearGradient(
                //                             begin: Alignment.topCenter,
                //                             end: Alignment.bottomCenter,
                //                             colors: [
                //                               Color.fromARGB(255, 46, 44, 94),
                //                               Color.fromARGB(255, 46, 44, 94),
                //                             ],
                //                             stops: [
                //                               0.0,
                //                               1.0
                //                             ])),
                //                     child: Row(
                //                       children: [
                //                         Expanded(
                //                           child: Padding(
                //                             padding: const EdgeInsets.fromLTRB(
                //                                 20, 0, 0, 0),
                //                             child: Text(
                //                               'લોટ એન્ટ્રી',
                //                               textAlign: TextAlign.center,
                //                               style: GoogleFonts.lato(
                //                                 shadows: const [
                //                                   Shadow(
                //                                     blurRadius: 1.0,
                //                                     color: Colors.black,
                //                                     offset: Offset(1.0, 1.0),
                //                                   ),
                //                                 ],
                //                                 fontSize: 17,
                //                                 fontWeight: FontWeight.w600,
                //                                 color: Colors.white,
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           width: 30,
                //                           child: InkWell(
                //                             onTap: () {
                //                               popView = false;
                //                               setState(() {});
                //                             },
                //                             child: const Icon(
                //                               CupertinoIcons.clear,
                //                               color: Colors.white,
                //                               size: 20,
                //                             ),
                //                           ),
                //                         )
                //                       ],
                //                     ),
                //                   ),
                //                   Expanded(
                //                       child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: <Widget>[
                //                       Padding(
                //                         padding: const EdgeInsets.fromLTRB(
                //                             10, 10, 10, 0),
                //                         child: Container(
                //                           width: 200,
                //                           height: 35,
                //                           decoration: const ShapeDecoration(
                //                             shape: RoundedRectangleBorder(
                //                               side: BorderSide(
                //                                   width: 1.0,
                //                                   style: BorderStyle.solid,
                //                                   color: Colors.black38),
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(5.0)),
                //                             ),
                //                           ),
                //                           child: DropdownButton(
                //                             dropdownColor:
                //                                 Colors.white.withOpacity(0.93),
                //                             underline: Container(
                //                                 color: Colors.transparent),
                //                             hint: partySelected == "Name"
                //                                 ? Center(
                //                                     child: Text(
                //                                       'પાર્ટી દાખલ કરો ',
                //                                       style: GoogleFonts.lato(
                //                                           shadows: const [
                //                                             Shadow(
                //                                               blurRadius: 0.5,
                //                                               color: Colors.black,
                //                                               offset: Offset(
                //                                                   0.5, 0.5),
                //                                             ),
                //                                           ],
                //                                           fontWeight:
                //                                               FontWeight.w400,
                //                                           color:
                //                                               Colors.red.shade200,
                //                                           fontSize: 12),
                //                                     ),
                //                                   )
                //                                 : Center(
                //                                     child: Text(
                //                                       partySelected,
                //                                       style: GoogleFonts.lato(
                //                                           shadows: const [
                //                                             Shadow(
                //                                               blurRadius: 0.5,
                //                                               color: Colors.black,
                //                                               offset: Offset(
                //                                                   0.5, 0.5),
                //                                             ),
                //                                           ],
                //                                           fontWeight:
                //                                               FontWeight.w400,
                //                                           color: const Color
                //                                                   .fromARGB(
                //                                               255, 46, 44, 94),
                //                                           fontSize: 12),
                //                                     ),
                //                                   ),
                //                             isExpanded: true,
                //                             iconSize: 30.0,
                //                             borderRadius:
                //                                 BorderRadius.circular(8),
                //                             alignment: Alignment.center,
                //                             style: GoogleFonts.lato(
                //                                 shadows: const [
                //                                   Shadow(
                //                                     blurRadius: 0.5,
                //                                     color: Colors.black,
                //                                     offset: Offset(0.5, 0.5),
                //                                   ),
                //                                 ],
                //                                 fontWeight: FontWeight.w600,
                //                                 color: const Color.fromARGB(
                //                                     255, 46, 44, 94),
                //                                 fontSize: 14),
                //                             items: partylist.map(
                //                               (val) {
                //                                 return DropdownMenuItem<String>(
                //                                   value: val,
                //                                   child: Text(val),
                //                                 );
                //                               },
                //                             ).toList(),
                //                             onChanged: (val) {
                //                               FocusScope.of(context).nextFocus();

                //                               setState(
                //                                 () {
                //                                   partySelected = val.toString();

                //                                   int v1 = partylist.indexOf(val);
                //                                   partyKeySelected = eKey[v1];
                //                                   print(partyKeySelected);
                //                                   // mobile_seleced =
                //                                   //     mobilelist[v1];
                //                                   // print(mobile_seleced);
                //                                   // getbhav(context,
                //                                   //     mobile_seleced);
                //                                   // getDataBaki(
                //                                   //     context,
                //                                   //     mobile_seleced,
                //                                   //     "today");
                //                                 },
                //                               );
                //                             },
                //                           ),
                //                         ),
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.fromLTRB(
                //                             10, 10, 10, 0),
                //                         child: Container(
                //                           width: 200,
                //                           height: 35,
                //                           decoration: const ShapeDecoration(
                //                             shape: RoundedRectangleBorder(
                //                               side: BorderSide(
                //                                   width: 1.0,
                //                                   style: BorderStyle.solid,
                //                                   color: Colors.black38),
                //                               borderRadius: BorderRadius.all(
                //                                   Radius.circular(5.0)),
                //                             ),
                //                           ),
                //                           child: DropdownButton(
                //                             dropdownColor:
                //                                 Colors.white.withOpacity(0.93),
                //                             underline: Container(
                //                                 color: Colors.transparent),
                //                             hint: bhavSelected == "Bhav"
                //                                 ? Center(
                //                                     child: Text(
                //                                       'ભાવ દાખલ કરો',
                //                                       style: GoogleFonts.lato(
                //                                           shadows: const [
                //                                             Shadow(
                //                                               blurRadius: 0.5,
                //                                               color: Colors.black,
                //                                               offset: Offset(
                //                                                   0.5, 0.5),
                //                                             ),
                //                                           ],
                //                                           fontWeight:
                //                                               FontWeight.w400,
                //                                           color:
                //                                               Colors.red.shade200,
                //                                           fontSize: 12),
                //                                     ),
                //                                   )
                //                                 : Center(
                //                                     child: Text(
                //                                       bhavSelected,
                //                                       style: GoogleFonts.lato(
                //                                           shadows: const [
                //                                             Shadow(
                //                                               blurRadius: 0.5,
                //                                               color: Colors.black,
                //                                               offset: Offset(
                //                                                   0.5, 0.5),
                //                                             ),
                //                                           ],
                //                                           fontWeight:
                //                                               FontWeight.w400,
                //                                           color: const Color
                //                                                   .fromARGB(
                //                                               255, 46, 44, 94),
                //                                           fontSize: 12),
                //                                     ),
                //                                   ),
                //                             isExpanded: true,
                //                             iconSize: 30.0,
                //                             borderRadius:
                //                                 BorderRadius.circular(8),
                //                             alignment: Alignment.center,
                //                             style: GoogleFonts.lato(
                //                                 shadows: const [
                //                                   Shadow(
                //                                     blurRadius: 0.5,
                //                                     color: Colors.black,
                //                                     offset: Offset(0.5, 0.5),
                //                                   ),
                //                                 ],
                //                                 fontWeight: FontWeight.w600,
                //                                 color: const Color.fromARGB(
                //                                     255, 46, 44, 94),
                //                                 fontSize: 14),
                //                             items: bhavLIST.map(
                //                               (val) {
                //                                 return DropdownMenuItem<String>(
                //                                   alignment: Alignment.center,
                //                                   value: val,
                //                                   child: Text(val),
                //                                 );
                //                               },
                //                             ).toList(),
                //                             onChanged: (val) {
                //                               FocusScope.of(context).nextFocus();

                //                               setState(
                //                                 () {
                //                                   bhavSelected = val.toString();

                //                                   // int v1 = partylist
                //                                   //     .indexOf(val);
                //                                   // gam_selected =
                //                                   //     gamlist[v1];
                //                                   // mobile_seleced =
                //                                   //     mobilelist[v1];
                //                                   // print(mobile_seleced);
                //                                   // getbhav(context,
                //                                   //     mobile_seleced);
                //                                   // getDataBaki(
                //                                   //     context,
                //                                   //     mobile_seleced,
                //                                   //     "today");
                //                                 },
                //                               );
                //                             },
                //                           ),
                //                         ),
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.fromLTRB(
                //                             10, 10, 10, 0),
                //                         child: SizedBox(
                //                           width: 200,
                //                           height: 35,
                //                           child: TextFormField(
                //                             controller: picT,
                //                             textInputAction: TextInputAction.next,
                //                             inputFormatters: [
                //                               // ignore: deprecated_member_use
                //                               FilteringTextInputFormatter.allow(
                //                                   RegExp('[0-9]')),
                //                               LengthLimitingTextInputFormatter(
                //                                   10),
                //                             ],
                //                             textAlign: TextAlign.center,
                //                             textAlignVertical:
                //                                 TextAlignVertical.center,
                //                             style: GoogleFonts.lato(
                //                                 shadows: [
                //                                   Shadow(
                //                                     blurRadius: 0.5,
                //                                     color: Colors.black87,
                //                                     offset: Offset(0.5, 0.5),
                //                                   ),
                //                                 ],
                //                                 fontWeight: FontWeight.w400,
                //                                 color: Colors.black,
                //                                 fontSize: 15),
                //                             cursorColor: Color.fromARGB(
                //                                 255, 215, 181, 109),
                //                             decoration: InputDecoration(
                //                               labelText: 'નંગ',
                //                               labelStyle: GoogleFonts.lato(
                //                                   shadows: [
                //                                     Shadow(
                //                                       blurRadius: 0.5,
                //                                       color: Colors.black87,
                //                                       offset: Offset(0.5, 0.5),
                //                                     ),
                //                                   ],
                //                                   fontWeight: FontWeight.w400,
                //                                   color: const Color.fromARGB(
                //                                       255, 46, 44, 94),
                //                                   fontSize: 17),
                //                               border: OutlineInputBorder(),
                //                               focusedBorder: OutlineInputBorder(
                //                                 borderSide: BorderSide(
                //                                     color: Color.fromARGB(
                //                                         255, 215, 181, 109),
                //                                     width: 2.0),
                //                                 borderRadius:
                //                                     BorderRadius.circular(5.0),
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.fromLTRB(
                //                             10, 10, 10, 20),
                //                         child: SizedBox(
                //                           width: 200,
                //                           height: 35,
                //                           child: TextFormField(
                //                             controller: vajanT,
                //                             textInputAction: TextInputAction.next,
                //                             textAlign: TextAlign.center,
                //                             inputFormatters: [
                //                               // ignore: deprecated_member_use
                //                               FilteringTextInputFormatter.allow(
                //                                   RegExp('[0-9.]')),
                //                               LengthLimitingTextInputFormatter(
                //                                   10),
                //                             ],
                //                             textAlignVertical:
                //                                 TextAlignVertical.center,
                //                             style: GoogleFonts.lato(
                //                                 shadows: [
                //                                   Shadow(
                //                                     blurRadius: 0.5,
                //                                     color: Colors.black87,
                //                                     offset: Offset(0.5, 0.5),
                //                                   ),
                //                                 ],
                //                                 fontWeight: FontWeight.w400,
                //                                 color: Colors.black,
                //                                 fontSize: 15),
                //                             cursorColor: Color.fromARGB(
                //                                 255, 215, 181, 109),
                //                             decoration: InputDecoration(
                //                               labelText: 'વજન',
                //                               labelStyle: GoogleFonts.lato(
                //                                   shadows: [
                //                                     Shadow(
                //                                       blurRadius: 0.5,
                //                                       color: Colors.black87,
                //                                       offset: Offset(0.5, 0.5),
                //                                     ),
                //                                   ],
                //                                   fontWeight: FontWeight.w400,
                //                                   color: const Color.fromARGB(
                //                                       255, 46, 44, 94),
                //                                   fontSize: 17),
                //                               border: OutlineInputBorder(),
                //                               focusedBorder: OutlineInputBorder(
                //                                 borderSide: BorderSide(
                //                                     color: Color.fromARGB(
                //                                         255, 215, 181, 109),
                //                                     width: 2.0),
                //                                 borderRadius:
                //                                     BorderRadius.circular(5.0),
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                       Padding(
                //                           padding: const EdgeInsets.all(3.0),
                //                           child: uploadCHECK
                //                               ? const SizedBox(
                //                                   height: 35,
                //                                   child: GFLoader(
                //                                       type: GFLoaderType.custom,
                //                                       child: Image(
                //                                         image: AssetImage(
                //                                             "assets/photos/loder.gif"),
                //                                         fit: BoxFit.cover,
                //                                       )),
                //                                 )
                //                               : Material(
                //                                   elevation: 3.0,
                //                                   color: progres
                //                                       ? const Color.fromARGB(
                //                                           255, 46, 44, 94)
                //                                       : Colors.red,
                //                                   borderRadius:
                //                                       BorderRadius.circular(8),
                //                                   child: InkWell(
                //                                     splashColor: Color.fromARGB(
                //                                         255, 215, 181, 109),
                //                                     splashFactory:
                //                                         InkSplash.splashFactory,
                //                                     borderRadius:
                //                                         BorderRadius.circular(8),
                //                                     focusColor: Colors.lightBlue,
                //                                     onTap: () async {
                //                                       uploadCHECK = true;
                //                                       setState(() {});

                //                                       String pic = picT.text;
                //                                       String vajan = vajanT.text;

                //                                       if (pic != "" &&
                //                                           vajan != "" &&
                //                                           partySelected !=
                //                                               "Name" &&
                //                                           bhavSelected !=
                //                                               "Bhav" &&
                //                                           partyKeySelected !=
                //                                               "") {
                //                                         picT =
                //                                             TextEditingController(
                //                                                 text: "");
                //                                         vajanT =
                //                                             TextEditingController(
                //                                                 text: "");
                //                                         double mony =
                //                                             double.parse(pic) *
                //                                                 double.parse(
                //                                                     bhavSelected);
                //                                         print(pic);
                //                                         print(vajan);
                //                                         print(partySelected);
                //                                         print(bhavSelected);
                //                                         print(mony);
                //                                         print(partyKeySelected);
                //                                         print(kKEY);
                //                                       } else {
                //                                         progres = false;
                //                                         setState(() {});
                //                                         uploadCHECK = false;
                //                                         setState(() {});
                //                                       }
                //                                     },
                //                                     child: Container(
                //                                       decoration: BoxDecoration(
                //                                         boxShadow: const [
                //                                           BoxShadow(
                //                                               color:
                //                                                   Colors.black26,
                //                                               offset:
                //                                                   Offset(0, 1),
                //                                               blurRadius: 1.0)
                //                                         ],
                //                                         borderRadius:
                //                                             BorderRadius.circular(
                //                                                 8.0),
                //                                       ),
                //                                       width: 140,
                //                                       height: 35,
                //                                       alignment: Alignment.center,
                //                                       child: Text(
                //                                         "એન્ટ્રી",
                //                                         style: GoogleFonts.lato(
                //                                             shadows: const [
                //                                               Shadow(
                //                                                 blurRadius: 1.0,
                //                                                 color:
                //                                                     Colors.black,
                //                                                 offset: Offset(
                //                                                     1.0, 1.0),
                //                                               ),
                //                                             ],
                //                                             fontWeight:
                //                                                 FontWeight.w800,
                //                                             color: Colors.white,
                //                                             fontSize: 17),
                //                                       ),
                //                                     ),
                //                                   )))
                //                     ],
                //                   ))
                //                 ],
                //               ),
                //             )),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     if (popView) {
          //       popView = false;
          //       setState(() {});
          //     } else {
          //       partySelected = "Name";
          //       bhavSelected = "Bhav";
          //       popView = true;
          //       setState(() {});
          //     }
          //   },
          //   child: Icon(
          //     popView ? CupertinoIcons.clear : CupertinoIcons.pencil,
          //     color: Color.fromARGB(255, 215, 181, 109),
          //   ),
          //   backgroundColor: const Color.fromARGB(255, 46, 44, 94),
          //   tooltip: 'Entry',
          //   elevation: 5,
          //   splashColor: Colors.grey,
          // ),
        ),
      ),
    );
  }

  Builder homeshow() {
    return Builder(builder: (BuildContext context) {
      return Container();
    });
  }

  void _showToast0(BuildContext context, String s1, String color1) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          "$s1",
          style: GoogleFonts.lato(shadows: [
            Shadow(
              blurRadius: 1.0,
              color: Colors.black,
              offset: Offset(1, 1),
            ),
          ], fontWeight: FontWeight.w900, letterSpacing: 1, color: Colors.white, fontSize: 13),
        ),
        backgroundColor: color1 == "0" ? Colors.redAccent : Colors.green,
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  showError() async {
    closer = true;
    setState(() {});
    await Future.delayed(Duration(microseconds: 1));

    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                // color: Colors.blueGrey.shade800,
                borderRadius: BorderRadius.all(Radius.circular(3)),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: SizedBox.expand(
                  child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // colorFilter: new ColorFilter.mode(
                    //     Colors.white.withOpacity(0.9), BlendMode.dstATop),
                    image: AssetImage(
                      "images/hanumanji.png",
                    ),
                  ),
                  color: Colors.blueGrey.shade800,
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Oh no!\n",
                            style: GoogleFonts.lato(shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ], fontWeight: FontWeight.w500, color: Colors.red, fontSize: 16)),
                        TextSpan(
                            text: "No Internet Found\nCheck your connection\nor try again",
                            style: GoogleFonts.lato(shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              ),
                            ], fontWeight: FontWeight.w300, color: Colors.white70, fontSize: 13)),
                      ]),
                    ),
                    InkWell(
                      onTap: () {
                        pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade700,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text("Close DSR",
                                  style: GoogleFonts.lato(shadows: [
                                    Shadow(
                                      blurRadius: 1.0,
                                      color: Colors.black,
                                      offset: Offset(1.0, 1.0),
                                    ),
                                  ], fontWeight: FontWeight.w100, letterSpacing: 1, color: Colors.white70, fontSize: 15))),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
        );
      },
    );
  }

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  void _showToast(BuildContext context, String s1) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text("$s1"),
        backgroundColor: Colors.redAccent,
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
