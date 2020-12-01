import 'package:catch_cow_app/cow/service/cow_service.dart';
import 'package:flutter/material.dart';
import 'cow.dart';

class CowViewModel extends ChangeNotifier {
  String cowNumber = '';
  String locale = '';
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
}
