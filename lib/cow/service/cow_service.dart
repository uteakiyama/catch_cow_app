import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CowService {
  Future<void> addCow({
    @required String cowNumber,
    @required String locale,
  }) async {
    CollectionReference cows = FirebaseFirestore.instance.collection('cows');
    return cows.add({
      'cowNumber': cowNumber,
      'locale': locale,
    });
  }

  Future<void> updateCow({
    @required String documentId,
    @required String cowNumber,
    @required String locale,
  }) {
    CollectionReference cows = FirebaseFirestore.instance.collection('cows');
    return cows.doc(documentId).update({
      'cowNumber': cowNumber,
      'locale': locale,
    });
  }

  Future<void> deleteCow({
    @required String documentId,
  }) {
    CollectionReference cows = FirebaseFirestore.instance.collection('cows');
    return cows.doc(documentId).delete();
  }
}
