import 'package:catch_cow_app/cow/post_cow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cow.dart';
import 'cow_view_model.dart';

class CowPage extends StatelessWidget {
  const CowPage({Key key, @required this.cow}) : super(key: key);
  final Cow cow;

  @override
  Widget build(BuildContext context) {
    final cowModel = Provider.of<CowViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('牛詳細'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PostCowPage(
                        isEdit: true, documentId: cow.documentId);
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_outline_outlined),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('警告'),
                      content: Text('削除しますか？'),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('いいえ'),
                        ),
                        FlatButton(
                          onPressed: () {
                            cowModel.deleteCow(documentId: cow.documentId);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text('はい'),
                        ),
                      ],
                    );
                  });
              // cow.updateCow(documentId: documentId, cowNumber: data['cowNumber'], locale: data['locale']);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cow.cowNumber,
              style: TextStyle(fontSize: 40),
            ),
            Text(
              cow.locale,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
