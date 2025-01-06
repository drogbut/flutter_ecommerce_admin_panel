import 'package:get/get.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  ///
  final RxList<double> weeklySales = <double>[].obs;
}
