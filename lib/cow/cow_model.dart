import 'package:cloud_firestore/cloud_firestore.dart';

// class Cow {
//   Cow({this.cowNumber, this.locale});
//
//   String cowNumber;
//   String locale;
// }

class Cow {
  Cow(DocumentSnapshot doc) {
    this.documentReference = doc.reference;

    this.documentID = doc.documentID;
    this.cowNumber = doc.data()['cowNumber'];
    this.locale = doc.data()['locale'];
  }
  String documentID;
  String cowNumber;
  String locale;
  DocumentReference documentReference;
}
