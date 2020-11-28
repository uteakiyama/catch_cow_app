import 'package:catch_cow_app/cow/cow.dart';
import 'package:catch_cow_app/cow/cow_page.dart';
import 'package:catch_cow_app/cow/cow_view_model.dart';
import 'package:catch_cow_app/user/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_cow_page.dart';
import 'cow_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;

class CowsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cow = Provider.of<CowViewModel>(context);
    final user = Provider.of<UserViewModel>(context);
    Auth.User loggedInUser = Auth.FirebaseAuth.instance.currentUser;
    CollectionReference cows = FirebaseFirestore.instance.collection('cows');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('タイトル'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: cows.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('読込中'),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document.data()['cowNumber']),
                  subtitle: new Text(document.data()['locale']),
                );
              }).toList(),
            );
          }),
    );
    // floatingActionButton: FloatingActionButton.extended(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   label: Text('追加'),
    //   icon: Icon(Icons.add),
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         fullscreenDialog: true,
    //         builder: (context) => AddCowPage(),
    //       ),
    //     );
    //   },
    // ),
  }
}
