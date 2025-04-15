import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../data/model/image.dart';
import '../../controllers/media_controller.dart';

class DragAndDropArea extends StatelessWidget {
  const DragAndDropArea({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());

    return TRoundedContainer(
      height: 250,
      width: double.infinity,
      showBorder: true,
      borderColor: TColors.borderPrimary,
      backgroundColor: TColors.primaryBackground,
      padding: EdgeInsets.all(TSizes.spaceBtwItems),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Image
          TRoundedImage(
              imageType: ImageType.asset, image: TImages.defaultMultiImageIcon),

          /// Text
          Flexible(
            fit: FlexFit.loose,
            child: Stack(
              children: [
                DropzoneView(
                  mime: ['image/jpeg', 'image/png', 'image/jpg'],
                  cursor: CursorType.grab,
                  operation: DragOperation.copy,
                  onCreated: (ctrl) => controller.dropzoneController = ctrl,
                  onDropFile: (DropzoneFileInterface file) async {
                    // Retrieve file data as Uint8List
                    final bytes =
                        await controller.dropzoneController.getFileData(file);

                    // Extract file metadata
                    final filename =
                        await controller.dropzoneController.getFilename(file);
                    final mimeType =
                        await controller.dropzoneController.getFileMIME(file);

                    // Init the model
                    final image = ImageModel(
                      url: '',
                      folder: '',
                      filename: filename,
                      contentType: mimeType,
                      localImageToDisplay: Uint8List.fromList(bytes),
                    );

                    // Add to the list
                    controller.selectedImagesToUpload.add(image);
                  },
                ),
                Center(child: Text('Drag and Drop files here')),
              ],
            ),
          ),

          /// Button
          SizedBox(
              child: OutlinedButton(
            child: Text('Select Images'),
            onPressed: () => controller.selectLocalImages(),
          )),
        ],
      ),
    );
  }
}
