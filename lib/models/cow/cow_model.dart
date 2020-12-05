import 'package:cloud_firestore/cloud_firestore.dart';

class Cow {
  Cow({
    this.documentId,
    this.cowNumber,
    this.locale,
    this.fileName,
    this.imageUrl,
  });

  String documentId;
  String cowNumber;
  String locale;
  String fileName;
  String imageUrl;
}
