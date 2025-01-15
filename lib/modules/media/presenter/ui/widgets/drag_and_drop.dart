import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

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
    final controller = MediaController.instance;

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
          TRoundedImage(imageType: ImageType.asset, image: TImages.defaultMultiImageIcon),

          /// Text
          Flexible(
            fit: FlexFit.loose,
            child: Stack(
              children: [
                DropzoneView(
                  mime: ['image/jpg', 'image/png'],
                  cursor: CursorType.grab,
                  operation: DragOperation.copy,
                  onCreated: (DropzoneViewController ctrl) => controller.dropzoneController = ctrl,
                  onLoaded: () => print('Zone loaded'),
                  onError: (String? ev) => print('Error: $ev'),
                  onHover: () => print('Zone hovered'),
                  onDropString: (String s) => print('Drop: $s'),
                  onDropStrings: (List<String>? strings) => print('Drop multiple: $strings'),
                  onLeave: () => print('Zone left'),
                  onDropFile: (DropzoneFileInterface ev) async {
                    // Retrieve file data as Uint8List
                    final bytes = await controller.dropzoneController.getFileData(ev);

                    // Extract file metadata
                    final filename = await controller.dropzoneController.getFilename(ev);
                    final mimeType = await controller.dropzoneController.getFileMIME(ev);

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
                  onDropInvalid: (ev) => print('Zone invalid MIME: $ev'),
                  onDropFiles: (ev) async => print('Zone drop multiple: $ev'),
                ),
                Center(child: Text('Drag and Drop files here')),
              ],
            ),
          ),

          /// Button
          SizedBox(child: OutlinedButton(onPressed: () {}, child: Text('Select Images'))),
        ],
      ),
    );
  }
}
