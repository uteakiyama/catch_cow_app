import 'package:catch_cow_app/cow/cow.dart';
import 'package:catch_cow_app/cow/cow_page.dart';
import 'package:catch_cow_app/cow/cow_view_model.dart';
import 'package:catch_cow_app/cow/post_cow_page.dart';
import 'package:catch_cow_app/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                await user.logoutFromFirebase();
                Navigator.pop(context);
              })
        ],
        title: Text(loggedInUser.email),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: cows.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('読込中'),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                child: ListTile(
                  title: Text(document.data()['cowNumber']),
                  subtitle: Text(document.data()['locale']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CowPage(
                            cow: Cow(
                              documentId: document.id,
                              cowNumber: document.data()['cowNumber'],
                              locale: document.data()['locale'],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                actions: <Widget>[
                  IconSlideAction(
                    caption: '編集',
                    color: Colors.blue,
                    icon: Icons.edit_outlined,
                    onTap: () {
                      //編集に飛ぶ
                      cow.changeCowNumberText(document.data()['cowNumber']);
                      cow.changeLocaleText(document.data()['locale']);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostCowPage(
                            isEdit: true,
                            documentId: document.id,
                          ),
                        ),
                      );
                    },
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: '削除',
                    color: Colors.red,
                    icon: Icons.delete_outline_outlined,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              // title: Text('削除'),
                              content: Text('この牛を削除しますか？'),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('いいえ')),
                                FlatButton(
                                    onPressed: () {
                                      cow.deleteCow(documentId: document.id);
                                      Navigator.pop(context);
                                    },
                                    child: Text('はい')),
                              ],
                            );
                          });
                    },
                  ),
                ],
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        label: Text('追加'),
        icon: Icon(Icons.add),
        onPressed: () {
          cow.resetAllText();
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) =>
                  PostCowPage(isEdit: false, documentId: null),
            ),
          );
        },
      ),
    );
  }
}
