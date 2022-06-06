import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_picker/widgets/date_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:varni_admin/controller/datecontroler.dart';
import 'package:varni_admin/datepicker/datepicker.dart';
import 'package:varni_admin/modals/karigar_models.dart';
import 'package:intl/intl.dart';
import '../controller/karigar_controler.dart';
import '../controller/userdata_controler.dart';
import '../strings/strings.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class KarigarView extends StatefulWidget {
  const KarigarView({Key? key}) : super(key: key);

  @override
  State<KarigarView> createState() => _KarigarViewState();
}

class _KarigarViewState extends State<KarigarView> {
  // GetBuilder<KarigarDataControler>(builder: ((controller) {return })),
  KarigarDataControler karigarDataControler = Get.put(KarigarDataControler());
  Datepicker0 datepicker0 = Datepicker0();

  UserData userData = Get.put(UserData());

  PageController _controller = PageController(initialPage: 0, viewportFraction: 0.8);
  bool screenBool = false;
  int globalINDEX = 0;
  String karigarKeySelect = "";
  String keychekar0 = "";
  String date1 = "";
  String date2 = "";
  DateContoller dateContoller = Get.put(DateContoller());
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
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
                                  String todayDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

                                  var parts0;
                                  var v10, v20, v30;
                                  parts0 = todayDate.split('-');
                                  v10 = parts0[0].trim();
                                  v20 = parts0[1].trim();
                                  v30 = parts0[2].trim();
                                  date1 = v10 + "-$v20" + "-01";
                                  date2 = v10 + "-$v20" + "-31";
                                  String a = datechanger(date1);
                                  String b = datechanger(date2);
                                  dateContoller.date1 = a.obs;
                                  dateContoller.date2 = b.obs;
                                  // await showDialog(
                                  //   context: context,
                                  //   builder: (context) => FutureProgressDialog(),
                                  // );
                                  userData.getlotCOMPLETE(date1, date2, karigarKeySelect, keychekar0, true);
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          GetBuilder<DateContoller>(builder: ((controller) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(() => Text(
                                      "From :${dateContoller.date1.obs}",
                                      style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                    )),
                                Text(
                                  "To :${dateContoller.date2.obs}",
                                  style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            );
                          })),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                datepicker0.showPicker(context, karigarKeySelect, keychekar0, true);
                              },
                              child: ImageIcon(
                                AssetImage("images/calendar.png"),
                                color: const Color.fromARGB(255, 43, 103, 122),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        Center(child: paymentView(context)),
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

  Builder paymentView(BuildContext context) {
    return Builder(builder: ((context) {
      return GetBuilder<KarigarDataControler>(builder: ((controller) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: userData.karigarPaymentlist.isNotEmpty
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
                                      height: 30,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "\u{20B9}" + userData.karigarPaymentlist[index].amo.toString(),
                                              style: GoogleFonts.lato(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 14),
                                            ),
                                          ),
                                          // Expanded(
                                          //   child: Container(),
                                          // ),
                                          // Padding(
                                          //   padding: const EdgeInsets.all(8.0),
                                          //   child: Row(
                                          //     children: [
                                          //       Text(
                                          //         datechanger(datelist0[index].toString()),
                                          //         style: GoogleFonts.lato(fontWeight: FontWeight.w600, color: Colors.black, fontSize: hoverList4[index] == "1" ? 15 : 14),
                                          //       ),
                                          //       SizedBox(
                                          //         width: 10,
                                          //       ),
                                          //       Text(
                                          //         timelist[index].toString(),
                                          //         style: GoogleFonts.lato(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: hoverList4[index] == "1" ? 13 : 12),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ));
                  })
              : Container(),
        );
      }));
    }));
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
                  height: keychekar0 == "JTC" ? 200 : 150,
                  width: double.infinity,
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 245, 245, 245),
                    child: Column(
                      children: [
                        Visibility(
                          visible: keychekar0 == "JTC" ? true : false,
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: ImageIcon(
                                        AssetImage("images/rupee.png"),
                                        size: 20,
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
                                                  'Rate',
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
                                                      karigarDataControler.karigardatalist[globalINDEX].bhav.toString(),
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
                                    child: InkWell(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: 'Change Rate',
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 40,
                                                    child: Center(
                                                      child: TextFormField(
                                                        style: GoogleFonts.lato(fontWeight: FontWeight.w400, color: Color.fromARGB(255, 43, 103, 122), fontSize: 14),
                                                        cursorColor: Color.fromARGB(255, 43, 103, 122),
                                                        textInputAction: TextInputAction.next,
                                                        inputFormatters: [
                                                          // ignore: deprecated_member_use
                                                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                                                          LengthLimitingTextInputFormatter(5),
                                                        ],
                                                        keyboardType: TextInputType.phone,
                                                        decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.zero,
                                                          hintStyle: TextStyle(color: Colors.grey),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: const BorderSide(color: Color.fromARGB(255, 43, 103, 122), width: 2.0),
                                                            borderRadius: BorderRadius.circular(10.0),
                                                          ),
                                                          hintText: "\u{20B9} Rate",
                                                          border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                          ),
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30.0,
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                  width: 100,
                                                  child: Material(
                                                    color: Color.fromARGB(255, 43, 103, 122),
                                                    borderRadius: BorderRadius.circular(10),
                                                    elevation: 2,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(5.0),
                                                      child: Center(
                                                        child: Text(
                                                          "Submit",
                                                          style: GoogleFonts.lato(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w600,
                                                            color: Color.fromARGB(255, 255, 255, 255),
                                                          ),
                                                          textAlign: TextAlign.center,
                                                          overflow: TextOverflow.clip,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            radius: 10.0);
                                      },
                                      child: Material(
                                        color: Color.fromARGB(255, 43, 103, 122),
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "Change",
                                            style: GoogleFonts.lato(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(255, 255, 255, 255),
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
                                        AssetImage("images/dot.png"),
                                        size: 18,
                                        color: karigarDataControler.karigardatalist[globalINDEX].login.toString() == "0" ? Colors.green.shade400 : Colors.red.shade400,
                                      )),
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
                                Expanded(
                                  flex: 1,
                                  child: CupertinoSwitch(
                                    activeColor: Colors.green.shade100,
                                    trackColor: Colors.red.shade100,
                                    thumbColor: Color.fromARGB(255, 43, 103, 122),
                                    value: karigarDataControler.karigardatalist[globalINDEX].login.toString() == "0" ? true : false,
                                    onChanged: (value) async {
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
                                  ),
                                )
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
                                    activeColor: Colors.green.shade100,
                                    trackColor: Colors.red.shade100,
                                    thumbColor: Color.fromARGB(255, 43, 103, 122),
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
