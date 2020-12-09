import 'package:catch_cow_app/models/medicine/medicine_model.dart';
import 'package:catch_cow_app/viewModels/medicine/medicine_view_model.dart';
import 'package:catch_cow_app/views/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'viewModels/cow/cow_view_model.dart';
import 'common/colors.dart';
import 'package:catch_cow_app/viewModels/user/user_view_model.dart';

import 'views/medicine/medicine_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CowViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MedicineViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SetMedicineName(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: _daysTheme,
        home: MedicinePage(),
      ),
    );
  }
}

final ThemeData _daysTheme = _buildDaysTheme();

ThemeData _buildDaysTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: primaryColorRegular,
    // appbar直したい
    // appBarTheme: AppBarTheme(
    //   color: backgroundWhite,
    //   textTheme: TextStyle(color: Colors.black),
    // ),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: primaryColorRegular,
      colorScheme: base.colorScheme.copyWith(
        secondary: kShrineBrown900,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: backgroundWhite,
    cardColor: backgroundWhite,
    textSelectionColor: primaryColorDark,
    errorColor: errorOrWarningColor,
    // TODO: Add the text themes (103)
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
  );
}
