import 'package:catch_cow_app/models/cow/cow_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../models/cow/cow_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CowViewModel extends ChangeNotifier {
  String cowNumber = '';
  String locale = '';
  File image;
  String imageUrl = '';
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  final List<Cow> cowList = [];

  void changeCowNumberText(String inputCowNumber) {
    cowNumber = inputCowNumber;
    notifyListeners();
  }

  void changeLocaleText(String inputLocale) {
    locale = inputLocale;
    notifyListeners();
  }

  void resetAllText() {
    cowNumber = '';
    locale = '';
    notifyListeners();
  }

  void postCow() async {
    // final imageUrl = await _uploadImageFile(); //つけた
    await CowService()
        .addCow(cowNumber: cowNumber, locale: locale, image: image);
  }

  void updateCow({@required String documentId}) async {
    // final imageUrl = await _uploadImageFile(); //つけた
    await CowService().updateCow(
        documentId: documentId,
        cowNumber: cowNumber,
        locale: locale,
        image: image);
  }

  void deleteCow({@required String documentId}) async {
    await CowService().deleteCow(documentId: documentId);
  }

  void changeImage(File inputImage) {
    image = inputImage;
    notifyListeners();
  }

  Future<String> _uploadImageFile() async {
    if (image == null) {
      return '';
    }
    // final int timestamp = DateTime.now().millisecondsSinceEpoch;
    // final String fileName =‘$timestamp.png’;
    final Reference reference = storage.ref().child(cowNumber);
    await reference.putFile(image);
    return await reference.getDownloadURL();
  }

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // String filePath = '${appDocDir.absolute}/file-to-upload.png';
    // // await uploadFile(filePath);
    notifyListeners();
  }

  // Future<void> uploadFile(String filePath) async {
  //   File file = File(filePath);
  //   await storage.ref().child('cow').putFile(file);
  // }

  void getImageFromCamera() async {
    final imageFileFromCamera =
        await ImagePicker().getImage(source: ImageSource.camera); // カメラから
    // String fileName = basename(imageFileFromCamera.path);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';
    // int timestamp = DateTime.now().millisecondsSinceEpoch;
    File file = File(filePath);
    await storage.ref('uploads/file-to-upload.png').putFile(file);
    // Reference ref = FirebaseStorage.instance.ref().child('osu.jpg');
    // await ref.putFile(File(pickedImage.path));
    // imageUrl = await ref.getDownloadURL();
  }

  void getImageFromGallery() async {
    final imageFileFromGallery =
        await ImagePicker().getImage(source: ImageSource.gallery); // ギャラリーから
  }
}
