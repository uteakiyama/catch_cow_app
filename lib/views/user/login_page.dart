import 'package:catch_cow_app/viewModels/medicine/medicine_view_model.dart';
import 'package:catch_cow_app/views/cow/cows_page.dart';
import 'package:catch_cow_app/views/user/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewModels/user/user_view_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context);
    final medicine = Provider.of<MedicineViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン画面'),
        actions: [
          FlatButton(
            onPressed: () {
              medicine.setDateOfWashoutPeriod();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            child: Text('新規登録'),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('メールアドレス'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (String inputMail) {
                  user.changeMailText(inputMail);
                },
              ),
            ),
            Text('パスワード'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (String inputPassword) {
                  user.changePasswordText(inputPassword);
                },
              ),
            ),
            RaisedButton(
              child: Text('ログイン'),
              onPressed: () async {
                await user.loginToFirebase();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CowsPage();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
