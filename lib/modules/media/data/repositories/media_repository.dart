import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

import '../../../../utils/constants/enums.dart';
import '../model/image.dart';

class MediaRepository extends GetxController {
  static MediaRepository get instance => Get.find();

  /// Firebase storage
  final _storage = FirebaseStorage.instance;
  final _db = FirebaseFirestore.instance;

  /// Upload any Image using Uint8List (compatible with DropzoneFileInterface)
  Future<ImageModel> uploadImageFromDeviceToStorage({
    required Uint8List data,
    required String path,
    required String imageName,
    required String contentType,
  }) async {
    try {
      // Reference to the storage location
      final ref = _storage.ref(p.join(path, imageName));
      final metadata = SettableMetadata(contentType: contentType);

      await ref.putData(data, metadata);
      final String downloadURL = await ref.getDownloadURL();
      final FullMetadata fullMetadata = await ref.getMetadata();

      return ImageModel.fromFirebaseMetadata(fullMetadata, path, imageName, downloadURL);
    } on FirebaseException catch (e) {
      throw e.message ?? 'An unknown firebase error occurred during upload.';
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message ?? 'An unknown platform error occurred during upload.';
    } catch (e) {
      throw e.toString();
    }
  }

  /// Upload image data in FireStore
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
      throw e.message ?? 'An unknown firebase error occurred during upload.';
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message ?? 'An unknown platform error occurred during upload.';
    } catch (e) {
      throw e.toString();
    }
  }

  /// Fetch images from FireStore based of mediaCategory and loadCount
  Future<List<ImageModel>> fetchImagesFromDatabase({
    required MediaCategory mediaCategory,
    required int loadCount,
  }) async {
    try {
      // Reference to the FireStore collection
      final querySnapshot = await FirebaseFirestore.instance
          .collection('images')
          .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
          .orderBy('createAt', descending: true)
          .limit(loadCount)
          .get();

      return querySnapshot.docs.map((element) => ImageModel.fromSnapshot(element)).toList();
    } on FirebaseException catch (e) {
      throw e.message ?? 'An unknown firebase error occurred during upload.';
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message ?? 'An unknown platform error occurred during upload.';
    } catch (e) {
      throw e.toString();
    }
  }

  /// Load more images from FireStore based of mediaCategory, oadCount and last fetch data.
  Future<List<ImageModel>> loadMoreImagesFromDatabase({
    required MediaCategory mediaCategory,
    required int loadCount,
    required DateTime lastFetchDate,
  }) async {
    try {
      // Reference to the FireStore collection
      final querySnapshot = await FirebaseFirestore.instance
          .collection('images')
          .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
          .orderBy('createAt', descending: true)
          .startAfter([lastFetchDate])
          .limit(loadCount)
          .get();

      return querySnapshot.docs.map((element) => ImageModel.fromSnapshot(element)).toList();
    } on FirebaseException catch (e) {
      throw e.message ?? 'An unknown firebase error occurred during upload.';
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message ?? 'An unknown platform error occurred during upload.';
    } catch (e) {
      throw e.toString();
    }
  }

  /// delete image from Firebase storage
  Future<void> deleteImagesFromStorage({required ImageModel image}) async {
    try {
      await _storage.ref(image.fullPath).delete();
      await _db.collection("images").doc(image.id).delete();
    } on FirebaseException catch (e) {
      throw e.message ?? 'An unknown firebase error occurred during deleting images.';
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message ?? 'An unknown platform error occurred during deleting images.';
    } catch (e) {
      throw e.toString();
    }
  }
}
