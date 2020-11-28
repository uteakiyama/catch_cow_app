import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cow_model.dart';

class CowViewModel extends ChangeNotifier {
  final firestore = Firestore.instance;
  String cowNumber = '';
  String locale = '';
  List<Cow> cows = [];

  void changeCowNumber(String inputCowNumber) {
    cowNumber = inputCowNumber;
    notifyListeners();
  }

  void changeLocale(String inputLocale) {
    locale = inputLocale;
    notifyListeners();
  }

  Future getCows() async {
    final snapshots = await Firestore.instance.collection('cows').snapshots();
    snapshots.listen((snapshot) {
      final cows = snapshot.docs.map((doc) => Cow(doc)).toList();
      this.cows = cows;
      notifyListeners();
    });
  }

  Future getCow() async {
    DocumentSnapshot snapshot = await Firestore.instance
        .collection('cows')
        .document('19qYhAQouV81Ik7H9DWu')
        .get();
    print(snapshot);
  }

  void reload() async {
    DocumentSnapshot snapshot = await Firestore.instance
        .collection('cows')
        .document('19qYhAQouV81Ik7H9DWu')
        .get();
    notifyListeners();
  }

  Future addCow() async {
    if (cowNumber.isEmpty) {
      throw ('耳評番号を入れてください');
    }
    await Firestore.instance.collection('cows').add(
      {
        'cowNumber': cowNumber,
        'locale': locale,
      },
    );
  }

  Future updateCow(Cow cow) async {
    // await Firestore.instance
    //     .collection('cows')
    //     .document(cow.documentID)
    //     .updateData(
    //   {
    //     'cowNumber': cowNumber,
    //     'locale': locale,
    //   },
    // var index =
  }

  Future deleteCow(Cow cow) async {
    await Firestore.instance
        .collection('cows')
        .document(cow.documentID)
        .delete();
  }
}
