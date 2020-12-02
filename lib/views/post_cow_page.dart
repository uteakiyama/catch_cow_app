import 'package:catch_cow_app/viewModels/cow_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostCowPage extends StatelessWidget {
  const PostCowPage({Key key, @required this.isEdit, this.documentId})
      : super(key: key);
  final bool isEdit;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    final cow = Provider.of<CowViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: isEdit ? Text('編集') : Text('投稿'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await cow.showImagePicker();
              },
              child: SizedBox(
                width: 160,
                height: 160,
                child: cow.imageFile != null
                    ? Image.file(cow.imageFile)
                    : Container(
                        color: Colors.grey,
                      ),
              ),
            ),
            FlatButton(
              onPressed: () {
                cow.getImageFromCamera();
              },
              child: Text('カメラ'),
            ),
            FlatButton(
              onPressed: () {
                // cow.getImageFromGallery();
                cow.showImagePicker();
              },
              child: Text('ギャラリー'),
            ),
            Text('title'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: cow.cowNumberEditingController,
                onChanged: (String inputCowNumber) {
                  cow.changeCowNumberText(inputCowNumber);
                },
              ),
            ),
            Text('subtitle'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: cow.localeEditingController,
                onChanged: (String inputLocale) {
                  cow.changeLocaleText(inputLocale);
                },
              ),
            ),
            RaisedButton(
              child: isEdit ? Text('保存') : Text('投稿'),
              onPressed: () {
                if (isEdit) {
                  cow.updateCow(documentId: documentId);
                } else {
                  cow.postCow();
                }
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
