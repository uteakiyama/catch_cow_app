import 'package:catch_cow_app/cow/cow_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cow = Provider.of<CowViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('新規追加'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: '耳標番号',
              hintText: '1234',
            ),
            keyboardType: TextInputType.number,
            onChanged: (String inputCowNumber) {
              cow.changeCowNumber(inputCowNumber);
            },
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            child: Text('追加する'),
            onPressed: () async {
              // firestoreに値を追加する
              await cow.addCow();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
