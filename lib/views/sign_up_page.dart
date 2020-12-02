import 'package:catch_cow_app/views/cows_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModels/user_view_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録'),
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
              child: Text('登録'),
              onPressed: () async {
                await user.signUpToFirebase();
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
