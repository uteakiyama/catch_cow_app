import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine {
  Medicine({
    this.documentId,
    this.cowNumber,
    this.medicineName,
    this.medicineCategory,
    this.washoutPeriod,
  });

  String documentId;
  String cowNumber;
  String medicineName;
  String medicineCategory;
  int washoutPeriod;
}
