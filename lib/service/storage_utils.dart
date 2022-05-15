import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class StorageUtils {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadPic(String id, PickedFile pickedFile) async {
    String uploadedPhotoUrl = '';
    Reference _reference = _storage.ref('material').child(id);
    if (kIsWeb) {
      await _reference
          .putData(
              await pickedFile.readAsBytes(),
              SettableMetadata(contentType: 'image/jpeg', customMetadata: {
                'id': id,
              }))
          .whenComplete(() async {
        await _reference.getDownloadURL().then((value) {
          uploadedPhotoUrl = value;
        });
      });
    } else {
      await _reference
          .putFile(
              File(pickedFile.path),
              SettableMetadata(contentType: 'image/jpeg', customMetadata: {
                'id': id,
              }))
          .whenComplete(() async {
        await _reference.getDownloadURL().then((value) {
          uploadedPhotoUrl = value;
        });
      }).catchError((error) => print(error));
    }
    return uploadedPhotoUrl;
  }
}
