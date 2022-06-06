import 'package:get/get.dart';

class DateContoller extends GetxController {
  RxString date1 = "".obs;
  RxString date2 = "".obs;
  void updateDate(String date0, String date00) {
    // changing from des = input.obs
    date1 = date0.obs;
    date2 = date00.obs;
  }
}
