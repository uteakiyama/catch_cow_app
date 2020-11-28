import 'package:catch_cow_app/cow/cows_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cow_view_model.dart';

class CowPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cow = Provider.of<CowViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('牛の追加'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              style: TextStyle(color: Colors.black87),
              obscureText: false,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: '耳標番号',
              ),
              keyboardType: TextInputType.number,
              onChanged: (String inputCowNumber) {
                cow.changeCowNumber(inputCowNumber);
              },
            ),
            TextField(
              enabled: true,
              maxLength: 10,
              maxLengthEnforced: false,
              style: TextStyle(color: Colors.black87),
              obscureText: false,
              maxLines: 1,
              decoration: InputDecoration(
                labelText: '場所',
              ),
              onChanged: (String inputLocale) {
                cow.changeLocale(inputLocale);
              },
            ),
            RaisedButton(
              child: const Text('送信'),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () async {
                await cow.addCow();
                Navigator.pop(context);
                // エラー処理入れたいな
              },
            ),
          ],
        ),
      ),
    );
  }
}
