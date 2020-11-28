import 'package:catch_cow_app/cow/cow_model.dart';
import 'package:catch_cow_app/cow/cows_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cow_view_model.dart';
import 'update_cow_page.dart';

class CowPage extends StatelessWidget {
  const CowPage({Key key, @required this.cow}) : super(key: key);
  final Cow cow;

  @override
  Widget build(BuildContext context) {
    final cow = Provider.of<CowViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('牛詳細'),
        actions: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => UpdateCowPage(model),
                //   ),
                // );
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('images/hol.png'),
            Text(
              cow.cowNumber.toString(),
              style: TextStyle(fontSize: 40, color: Colors.black54),
            ),
            Text(
              cow.locale,
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
