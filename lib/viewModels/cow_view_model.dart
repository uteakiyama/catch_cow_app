import 'package:catch_cow_app/config/cow_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../models/cow.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CowViewModel extends ChangeNotifier {
  String cowNumber = '';
  String locale = '';
  File imageFile;
  TextEditingController cowNumberEditingController;
  TextEditingController localeEditingController;
  final List<Cow> cowList = [];

  void changeCowNumberText(String inputCowNumber) {
    cowNumber = inputCowNumber;
    cowNumberEditingController = TextEditingController(text: cowNumber);
    notifyListeners();
  }

  void changeLocaleText(String inputLocale) {
    locale = inputLocale;
    localeEditingController = TextEditingController(text: locale);
    notifyListeners();
  }

  void resetAllText() {
    cowNumber = '';
    cowNumberEditingController = TextEditingController(text: cowNumber);
    locale = '';
    localeEditingController = TextEditingController(text: locale);
    notifyListeners();
  }

  void postCow() async {
    await CowService().addCow(cowNumber: cowNumber, locale: locale);
  }

  void updateCow(
      {@required String documentId, String cowNumber, String locale}) async {
    await CowService().updateCow(
        documentId: documentId, cowNumber: cowNumber, locale: locale);
  }

  void deleteCow({@required String documentId}) async {
    await CowService().deleteCow(documentId: documentId);
  }

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

  void getImageFromCamera() async {
    final imageFileFromCamera =
        await ImagePicker().getImage(source: ImageSource.camera); // カメラから
    // String fileName = basename(imageFileFromCamera.path);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';
    await CowService().uploadFile(filePath);
    // Reference ref = FirebaseStorage.instance.ref().child('osu.jpg');
    // await ref.putFile(File(pickedImage.path));
    // imageUrl = await ref.getDownloadURL();
  }

  void getImageFromGallery() async {
    final imageFileFromGallery =
        await ImagePicker().getImage(source: ImageSource.gallery); // ギャラリーから
  }
}
