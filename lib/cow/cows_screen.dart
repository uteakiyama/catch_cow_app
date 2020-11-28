// StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('cows').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('エラーが発生しました…');
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text("読み込み中です…");
//           }
//           return new ListView(
//             children: snapshot.data.documents.map((DocumentSnapshot document) {
//               return new ListTile(
//                 title: new Text(document.data()['cowNumber']),
//                 subtitle: new Text(document.data()['locale']),
//               );
//             }).toList(),
//           );
//         },
//       ),
//
//

// import 'package:catch_cow_app/cow/cow_page.dart';
// import 'package:catch_cow_app/cow/cow_view_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'add_cow_page.dart';
// import 'cow_page.dart';
//
// class CowsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<CowViewModel>(
//       create: (_) => CowViewModel()..getCows(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Cow Chasing'),
//         ),
//         body: Consumer<CowViewModel>(builder: (context, model, child) {
//           final cows = model.cows;
//           return ListView(
//             children: cows
//                 .map(
//                   (cows) => ListTile(
//                     title: Text(cows.cowNumber),
//                     onTap: () async {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CowPage(model),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//                 .toList(),
//           );
//         }),
//         floatingActionButton:
//             Consumer<CowViewModel>(builder: (context, model, child) {
//           return FloatingActionButton.extended(
//             backgroundColor: Theme.of(context).primaryColor,
//             label: Text('追加'),
//             icon: Icon(Icons.add),
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     fullscreenDialog: true,
//                     builder: (context) => AddCowPage(model),
//                   ));
//             },
//           );
//         }),
//       ),
//     );
//   }
// }
