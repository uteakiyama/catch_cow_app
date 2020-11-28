import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:flutter/cupertino.dart';

class AuthenticationService {
  Future<void> signUpWithEmail(
      {@required String email, @required String password}) async {
    try {
      await Auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await loginWithEmail(
          inputUserEmailAddress: email, inputUserPassword: password);
    } on Auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('すでに登録視されています');
      } else if (e.code == 'operation-not-allowed') {
        print('有効化されてません');
      } else if (e.code == 'invalid-email') {
        print('メアドの形式が間違っているでーす');
      } else {
        print('よくわからないけどとりあえずエラーでーす');
      }
    }
  }

  Future<void> loginWithEmail(
      {@required String inputUserEmailAddress,
      @required String inputUserPassword}) async {
    try {
      await Auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: inputUserEmailAddress, password: inputUserPassword);
      print('できた！');
    } on Auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('登録されてないメアドでーす');
      } else if (e.code == 'wrong-password') {
        print('登録されてないパスワードでーす');
      } else if (e.code == 'invalid-email') {
        print('メアドの形式が間違っているでーす');
      } else {
        print('よくわからないけどとりあえずエラーでーす');
      }
    }
  }

  Future<void> logout() async {
    await Auth.FirebaseAuth.instance.signOut();
  }
}
