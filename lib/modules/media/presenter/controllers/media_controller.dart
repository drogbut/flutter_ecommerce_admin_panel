import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/popups/dialogs.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../data/model/image.dart';
import '../../data/repositories/media_repository.dart';

class MediaController extends GetxController {
  /// Instances
  static MediaController get instance => Get.find();
  final mediaRepository = Get.put(MediaRepository());

  /// variables
  late DropzoneViewController dropzoneController;
  final RxBool showImageUploaderSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<MediaCategory> mediaCategory = <MediaCategory>[].obs;
  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;

  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProductImages = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImages = <ImageModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    initializeDropzoneController();
  }

  /// Method for initialising the dropzoneController
  void initializeDropzoneController() {
    DropzoneView(onCreated: (DropzoneViewController controller) {
      dropzoneController = controller;
    });
  }

  /// Select Local Images on Button Press
  Future<void> selectLocalImages() async {
    try {
      final files = await dropzoneController.pickFiles(multiple: true, mime: ['image/jpeg', 'image/png']);

      if (files.isNotEmpty) {
        for (var file in files) {
          // Retrieve file data as Uint8List
          final bytes = await dropzoneController.getFileData(file);

          // Extract file metadata
          final filename = await dropzoneController.getFilename(file);
          final mimeType = await dropzoneController.getFileMIME(file);

          final localImage = ImageModel(
            url: '',
            folder: '',
            filename: filename,
            contentType: mimeType,
            localImageToDisplay: Uint8List.fromList(bytes),
          );

          selectedImagesToUpload.add(localImage);
        }
      }
    } catch (e) {
      // Show a warning snack-bar for the error
      TLoaders.warningSnackBar(
          title: 'Error Uploading Local Images', message: 'Something went wrong while uploading your local images.');
    }
  }

  /// Display a SnackBar when images is uploaded
  void uploadImageConfirmations() {
    if (selectedPath.value == MediaCategory.folders) {
      TLoaders.warningSnackBar(title: 'Select folder', message: 'Please select the Folder in Order to upload Images.');
      return;
    }

    TDialogs.defaultDialog(
      context: Get.context!,
      title: 'Upload Images',
      confirmText: 'Upload',
      content: "Are you sure you want to upload all images in ${selectedPath.value.name.toUpperCase()} folder?",
      onConfirm: () async => await uploadImages(),
    );
  }

  /// Upload Images
  Future<void> uploadImages() async {
    try {
      // Close the confirmation dialog
      Get.back();

      // Show the loader dialog
      await uploadImagesLoader();

      // Get the selected category
      final MediaCategory selectedCategory = selectedPath.value;

      // Determine the target list based on the selected category
      RxList<ImageModel> targetList;

      // Check the selected category and update the corresponding list
      switch (selectedCategory) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImages;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImages;
          break;
        case MediaCategory.products:
          targetList = allProductImages;
          break;
        case MediaCategory.users:
          targetList = allUserImages;
          break;
        default:
          throw Exception('Invalid media category selected.');
      }

      // Upload and add images to the target list
      // Using a reverse loop to avoid 'Concurrent modification during iteration' error
      for (int i = selectedImagesToUpload.length - 1; i >= 0; i--) {
        final selectedImage = selectedImagesToUpload[i];

        if (selectedImage.localImageToDisplay == null || selectedImage.contentType == null) {
          throw Exception('Missing required data for image upload.');
        }

        // Upload the image to storage
        final uploadedImage = await mediaRepository.uploadImageFileInStorage(
          fileData: selectedImage.localImageToDisplay!,
          mimeType: selectedImage.contentType!,
          path: getSelectedPath(),
          imageName: selectedImage.filename,
        );

        // Assign additional properties
        // Use the copyWith instead Setter
        final updatedImage = uploadedImage.copyWith(mediaCategory: selectedCategory.name);

        // Upload metadata to FireStore and get the ID
        final id = await mediaRepository.uploadImageFileInDatabase(uploadedImage);

        final imageWithId = updatedImage.copyWith(id: id);
        //uploadedImage.id = id;

        // Remove the image from the local list and add it to the target list
        selectedImagesToUpload.removeAt(i);
        targetList.add(imageWithId);
      }

      // Stop the loader after a successful upload
      TFullScreenLoader.stopLoading();
    } catch (e, stackTrace) {
      // Log the error for debugging
      print('Error uploading images: $e\n$stackTrace');

      // Stop the loader if an error occurs
      TFullScreenLoader.stopLoading();

      // Show an error snack-bar
      TLoaders.warningSnackBar(
        title: 'Error Uploading Images',
        message: 'Something went wrong while uploading your images. Please try again.',
      );
    }
  }

  Future<void> uploadImagesLoader() {
    return showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text('Uploading images'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: TSizes.spaceBtwItems,
              children: [
                Image.asset(TImages.uploadingImageIllustration, height: 300, width: 300),
                Text('sit tight, your image are uploading...'),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Returns the selected path as a string based on the selected media category
  String getSelectedPath() {
    switch (selectedPath.value) {
      case MediaCategory.banners:
        return 'banners/';
      case MediaCategory.brands:
        return 'brands/';
      case MediaCategory.categories:
        return 'categories/';
      case MediaCategory.products:
        return 'products/';
      case MediaCategory.users:
        return 'users/';
      default:
        throw Exception('Invalid media category selected.');
    }
  }
}
