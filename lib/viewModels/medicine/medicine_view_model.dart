import 'package:catch_cow_app/models/cow/cow_service.dart';
import 'package:catch_cow_app/models/medicine/medicine_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../models/cow/cow_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MedicineViewModel extends ChangeNotifier {
  String medicineName = '';
  DateTime consultationDate = DateTime.now();
  int washoutPeriod;
  // DateTime test = DateTime.now().add(Duration(days: 2));
  File image;
  String imageUrl = '';
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  // final medicine = FirebaseFirestore.instance
  //     .collection('medicine')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) => {
  //           querySnapshot.docs.forEach((doc) {
  //             print(doc["medicineName"]);
  //           })
  //         });
  Stream collectionStream =
      FirebaseFirestore.instance.collection('medicine').snapshots();
  // final List<Medicine> medicineList = List.from(this.medicine);
  // final List<Medicine> medicineList = [];

  void setMedicineName(String newValue) {
    medicineName = newValue;
    notifyListeners();
  }

  void setConsultationDate(DateTime inputConsultationDate) {
    consultationDate = inputConsultationDate;
    notifyListeners();
  }

  void setDateOfWashoutPeriod() {
    consultationDate = DateTime.now();
    washoutPeriod = 2;
    print(consultationDate.add(Duration(days: washoutPeriod)));
    final test = consultationDate.add(Duration(days: washoutPeriod));
    notifyListeners();
  }

  void resetAllText() {
    medicineName = '';
    notifyListeners();
  }
}

class TimeStore with ChangeNotifier {
  DateTime _date = DateTime.now();
  get date => _date;
  bool _isShowTimePicker = false;
  bool get isShowTimePicker => _isShowTimePicker;
  bool _isIconLoading = false;
  bool get isIconLoading => _isIconLoading;

  setDate(time) {
    _date = time;

    print(date);
    notifyListeners();
  }

  showTimePicker() {
    print("tapped");
    _isShowTimePicker = !_isShowTimePicker;
    notifyListeners();
  }
}

class SetMedicineName with ChangeNotifier {
  List<String> _items = ['セファゾリン', 'two'];

  String _selectedItem;

  List<String> get items => _items;
  String get selected => _selectedItem;

  void setSelectedItem(String s) {
    _selectedItem = s;
    notifyListeners();
  }
}

// void postCow() async {
//   // final imageUrl = await _uploadImageFile(); //つけた
//   await CowService()
//       .addCow(cowNumber: cowNumber, locale: locale, image: image);
// }

// void updateCow({@required String documentId}) async {
//   // final imageUrl = await _uploadImageFile(); //つけた
//   await CowService().updateCow(
//       documentId: documentId,
//       cowNumber: cowNumber,
//       locale: locale,
//       image: image);
// }
//
//   void deleteCow({@required String documentId}) async {
//     await CowService().deleteCow(documentId: documentId);
//   }
//
//   void changeImage(File inputImage) {
//     image = inputImage;
//     notifyListeners();
//   }
//
//   Future<String> _uploadImageFile() async {
//     if (image == null) {
//       return '';
//     }
//     // final int timestamp = DateTime.now().millisecondsSinceEpoch;
//     // final String fileName =‘$timestamp.png’;
//     final Reference reference = storage.ref().child(cowNumber);
//     await reference.putFile(image);
//     return await reference.getDownloadURL();
//   }
//
//   Future showImagePicker() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     image = File(pickedFile.path);
//     // Directory appDocDir = await getApplicationDocumentsDirectory();
//     // String filePath = '${appDocDir.absolute}/file-to-upload.png';
//     // // await uploadFile(filePath);
//     notifyListeners();
//   }
//
//   // Future<void> uploadFile(String filePath) async {
//   //   File file = File(filePath);
//   //   await storage.ref().child('cow').putFile(file);
//   // }
//
//   void getImageFromCamera() async {
//     final imageFileFromCamera =
//         await ImagePicker().getImage(source: ImageSource.camera); // カメラから
//     // String fileName = basename(imageFileFromCamera.path);
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String filePath = '${appDocDir.absolute}/file-to-upload.png';
//     // int timestamp = DateTime.now().millisecondsSinceEpoch;
//     File file = File(filePath);
//     await storage.ref('uploads/file-to-upload.png').putFile(file);
//     // Reference ref = FirebaseStorage.instance.ref().child('osu.jpg');
//     // await ref.putFile(File(pickedImage.path));
//     // imageUrl = await ref.getDownloadURL();
//   }
//
//   void getImageFromGallery() async {
//     final imageFileFromGallery =
//         await ImagePicker().getImage(source: ImageSource.gallery); // ギャラリーから
//   }
// }
