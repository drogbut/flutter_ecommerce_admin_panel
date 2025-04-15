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

  final RxBool loading = false.obs;
  final int initialLoadCount = 1;
  final int loadMoreCount = 2;

  /// Select Local Images on Button Press
  Future<void> selectLocalImages() async {
    try {
      final files = await dropzoneController.pickFiles(
          multiple: true, mime: ['image/jpeg', 'image/jpg', 'image/png']);

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
            file: file,
          );

          selectedImagesToUpload.add(localImage);
        }
      }
    } catch (e) {
      // Show a warning snack-bar for the error
      TLoaders.warningSnackBar(
          title: 'Error Uploading Local Images',
          message: 'Something went wrong while uploading your local images.');
    }
  }

  /// Display a SnackBar when images is uploaded
  void uploadImageConfirmations() {
    if (selectedPath.value == MediaCategory.folders) {
      TLoaders.warningSnackBar(
          title: 'Select folder',
          message: 'Please select the Folder in Order to upload Images.');
      return;
    }

    TDialogs.defaultDialog(
      context: Get.overlayContext!,
      title: 'Upload Images',
      confirmText: 'Upload',
      content:
          "Are you sure you want to upload all images in ${selectedPath.value.name.toUpperCase()} folder?",
      onConfirm: () async => await uploadImages(),
    );
  }

  /// Upload Images
  Future<void> uploadImages() async {
    try {
      // Close the confirmation dialog
      if (Get.isDialogOpen ?? false) Get.back();

      // Show the loader dialog
      await uploadImagesLoader();

      // Get the selected category
      final MediaCategory selectedCategory = selectedPath.value;

      // Determine the target list based on the selected category
      final targetList = getCurrentImageList();

      // Upload and add images to the target list
      // Using a reverse loop to avoid 'Concurrent modification during iteration' error
      for (int i = selectedImagesToUpload.length - 1; i >= 0; i--) {
        final selectedImage = selectedImagesToUpload[i];

        if (selectedImage.localImageToDisplay == null ||
            selectedImage.contentType == null) {
          throw Exception('Missing required data for image upload.');
        }

        final uploadedImage =
            await mediaRepository.uploadImageFromDeviceToStorage(
          data: selectedImage.localImageToDisplay!,
          path: getSelectedPath(),
          imageName: selectedImage.filename,
          contentType: selectedImage.contentType!,
        );

        final updatedImage =
            uploadedImage.copyWith(mediaCategory: selectedCategory.name);
        final id =
            await mediaRepository.uploadImageFileInDatabase(updatedImage);
        final imageWithId = updatedImage.copyWith(id: id);

        // Remove the image from the local list and add it to the target list
        selectedImagesToUpload.removeAt(i);
        targetList.add(imageWithId);
      }

      // Stop the loader after a successful upload
      Get.back();
    } catch (e) {
      // Stop the loader if an error occurs
      TFullScreenLoader.stopLoading();

      // Show an error snack-bar
      TLoaders.warningSnackBar(
        title: 'Error Uploading Images',
        message:
            'Something went wrong while uploading your images. Please try again.',
      );
    }
  }

  Future<void> uploadImagesLoader() {
    return Get.dialog(
      barrierDismissible: false,
      PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text('Uploading images'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: TSizes.spaceBtwItems,
            children: [
              Image.asset(TImages.uploadingImageIllustration,
                  height: 300, width: 300),
              Text('sit tight, your image are uploading...'),
            ],
          ),
        ),
      ),
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

  /// Get images
  Future<void> getMediaImages() async {
    try {
      // start Loading
      loading.value = true;

      // Set a target list
      final targetList = getCurrentImageList();

      // Get all categories images
      final images = await mediaRepository.fetchImagesFromDatabase(
          mediaCategory: selectedPath.value, loadCount: initialLoadCount);

      // Assign all to the target list
      targetList.assignAll(images);

      // Stop loading
      loading.value = false;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar(
          title: 'ohh Snap',
          message: 'Unable to fetch images, something went wrong. Try again.');
    }
  }

  /// Get images
  Future<void> loadMoreMediaImages() async {
    try {
      // start Loading
      loading.value = true;

      // Get the right target list reference
      RxList<ImageModel> targetList;

      if (selectedPath.value == MediaCategory.banners) {
        targetList = allBannerImages;
      } else if (selectedPath.value == MediaCategory.brands) {
        targetList = allBrandImages;
      } else if (selectedPath.value == MediaCategory.products) {
        targetList = allProductImages;
      } else if (selectedPath.value == MediaCategory.users) {
        targetList = allUserImages;
      } else if (selectedPath.value == MediaCategory.categories) {
        targetList = allCategoryImages;
      } else {
        loading.value = false;
        return;
      }

      // Fetch more images based on last item's createAt
      final images = await mediaRepository.loadMoreImagesFromDatabase(
        mediaCategory: selectedPath.value,
        loadCount: loadMoreCount,
        lastFetchDate: targetList.isNotEmpty
            ? targetList.last.createAt ?? DateTime.now()
            : DateTime.now(),
      );

      // Add all images to the existing target list
      targetList.addAll(images);

      // Stop loading
      loading.value = false;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar(
          title: 'ohh Snap',
          message: 'Unable to fetch images, something went wrong. Try again.');
    }
  }

  /// Get current images list.
  RxList<ImageModel> getCurrentImageList() {
    switch (selectedPath.value) {
      case MediaCategory.banners:
        return allBannerImages;
      case MediaCategory.brands:
        return allBrandImages;
      case MediaCategory.products:
        return allProductImages;
      case MediaCategory.users:
        return allUserImages;
      case MediaCategory.categories:
        return allCategoryImages;
      default:
        return <ImageModel>[].obs;
    }
  }
}
