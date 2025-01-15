import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/image.dart';

class MediaRepository extends GetxController {
  /// instance
  static MediaRepository get instance => Get.find();
  final _storage = FirebaseStorage.instance;

  /// Upload any Image using Uint8List (compatible with DropzoneFileInterface)
  Future<ImageModel> uploadImageFileInStorage({
    required Uint8List fileData,
    required String mimeType,
    required String path,
    required String imageName,
  }) async {
    try {
      // Reference to the storage location
      final Reference ref = _storage.ref('$path/$imageName');

      // Upload file using Uint8List
      final UploadTask uploadTask = ref.putData(fileData, SettableMetadata(contentType: mimeType));

      // Wait for the upload to complete
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

      // Get download URL
      final String downloadURL = await snapshot.ref.getDownloadURL();

      // Fetch metadata
      final FullMetadata metadata = await ref.getMetadata();
      return ImageModel.fromFirebaseMetadata(metadata, path, imageName, downloadURL);
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> uploadImageFileInDatabase(ImageModel image) async {
    try {
      // Reference to the FireStore collection
      final collection = FirebaseFirestore.instance.collection('images');

      // Convert the ImageModel object into a Map compatible with FireStore
      final imageData = image.toJson();

      // Add the image to the FireStore collection
      final documentRef = await collection.add(imageData);

      // Return the ID of the document added
      return documentRef.id;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
