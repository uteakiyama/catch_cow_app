import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class CowService {
  Future<void> addCow({
    @required String cowNumber,
    @required String locale,
    String imageUrl,
  }) async {
    CollectionReference cows = FirebaseFirestore.instance.collection('cows');
    return cows.add({
      'cowNumber': cowNumber,
      'locale': locale,
      'imageUrl': imageUrl,
    });
  }

  Future<void> updateCow({
    @required String documentId,
    @required String cowNumber,
    @required String locale,
    String imageUrl,
  }) {
    CollectionReference cows = FirebaseFirestore.instance.collection('cows');
    return cows.doc(documentId).update({
      'cowNumber': cowNumber,
      'locale': locale,
      'imageUrl': imageUrl,
    });
  }

  Future<void> deleteCow({
    @required String documentId,
  }) {
    CollectionReference cows = FirebaseFirestore.instance.collection('cows');
    return cows.doc(documentId).delete();
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);
    await firebase_storage.FirebaseStorage.instance
        .ref('uploads/file-to-upload.png')
        .putFile(file);
    // 本当は
  }
}
