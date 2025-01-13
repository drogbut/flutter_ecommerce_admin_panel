import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/enums.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  ///
  final RxBool showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<MediaCategory> mediaCategory = <MediaCategory>[].obs;
  late DropzoneViewController dropzoneViewController;
}
