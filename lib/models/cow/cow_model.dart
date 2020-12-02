import 'package:cloud_firestore/cloud_firestore.dart';

class Cow {
  Cow({this.documentId, this.cowNumber, this.locale, this.imageUrl});

  String documentId;
  String cowNumber;
  String locale;
  String imageUrl;
}
