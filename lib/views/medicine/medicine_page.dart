import 'package:catch_cow_app/models/medicine/medicine_model.dart';
import 'package:catch_cow_app/viewModels/cow/cow_view_model.dart';
import 'package:catch_cow_app/viewModels/medicine/medicine_view_model.dart';
import 'package:catch_cow_app/views/cow/post_cow_page.dart';
import 'package:catch_cow_app/viewModels/medicine/time_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({Key key, @required this.medicine}) : super(key: key);
  final Medicine medicine;

  @override
  Widget build(BuildContext context) {
    final medicineViewModel = Provider.of<MedicineViewModel>(context);
    final setMedicineName = Provider.of<SetMedicineName>(context);
    // final format = DateFormat("yyyy年MM月dd日");
    // final DateTime consultationDate = DateTime.now();
    // final washoutPeriod = 6;
    String dropdownValue;
    // final document = FirebaseFirestore.instance
    //     .collection('medicine')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) => {
    //           querySnapshot.docs.forEach((doc) {
    //             print(doc["medicineName"]);
    //           })
    //         });
    Stream collectionStream =
        FirebaseFirestore.instance.collection('medicine').snapshots();
    // final List<Medicine> medicineList = List.from();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String newValue) {
              medicineViewModel.setMedicineName(newValue);
              print(collectionStream);
            },
            items: setMedicineName.items
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Text(medicineViewModel.medicineName),
        ],
      ),
      // StreamBuilder<QuerySnapshot>(
      //     stream:
      //         FirebaseFirestore.instance.collection('medicine').snapshots(),
      //     builder: (BuildContext context,
      //         AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: Text('読込中'),
      //         );
      //       }
      //
      //       return ListView(
      //         children: snapshot.data.docs.map((DocumentSnapshot document) {
      //           List<String> medicine = List.from(document['medicine']);
      //           return new ListTile(
      //             title: new Text(document.data()['medicineName']),
      //             subtitle: new Text(document.data()['medicineCategory']),
      //           );
      //         }).toList(),
      //       );
      //     }),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('薬品'),
    //     centerTitle: true,
    //     backgroundColor: Theme.of(context).primaryColor,
    //     elevation: 0.0,
    //   ),
    //   body: Column(
    //     children: [
    //       DateTimeField(
    //         format: format,
    //         initialValue: consultationDate,
    //         textAlign: TextAlign.center,
    //         decoration: InputDecoration(
    //           border: InputBorder.none,
    //         ),
    //         onShowPicker: (context, currentValue) {
    //           return showDatePicker(
    //               context: context,
    //               firstDate: DateTime.now(),
    //               initialDate: DateTime.now(),
    //               lastDate: DateTime(2100));
    //         },
    //         onChanged: (DateTime inputConsultationDate) {
    //           medicineViewModel.setConsultationDate(inputConsultationDate);
    //           print(inputConsultationDate);
    //         },
    //       ),
    //       Text('休薬期間'),
    //       Text(DateFormat('yyyy年MM月dd日').format(medicineViewModel
    //           .consultationDate
    //           .add(Duration(days: washoutPeriod)))),
    //     ],
    //   ),
    // );
  }
}
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   String dropdownValue = 'One';
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: 'One',
//       icon: Icon(Icons.arrow_downward),
//       iconSize: 24,
//       elevation: 16,
//       style: TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String newValue) {
//         setState(() {
//           dropdownValue = newValue;
//         });
//       },
//       items: <String>['One', 'Two', 'Free', 'Four']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
