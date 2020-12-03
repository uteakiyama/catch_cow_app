import 'dart:io';
import 'package:catch_cow_app/viewModels/cow/cow_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

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
        title: isEdit ? Text('編集') : Text('追加'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cow.image == null
                ? Text('画像が選択されていません')
                : Image.file(
                    cow.image,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
            FlatButton(
                onPressed: () async {
                  final pickedFile =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  cow.changeImage(
                    File(pickedFile.path),
                  );
                },
                child: Text('ギャラリー')),
            // InkWell(
            //   onTap: () async {
            //     final pickedFile =
            //         await ImagePicker().getImage(source: ImageSource.gallery);
            //     cow.changeImage(File(pickedFile.path));
            //   },
            //   child: SizedBox(
            //     width: 160,
            //     height: 160,
            //     child: cow.image != null
            //         ? Image.file(cow.image)
            //         : Card(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Icon(Icons.photo_library_outlined),
            //                 Text('ギャラリー'),
            //               ],
            //             ),
            //             color: Colors.white,
            //           ),
            //   ),
            // ),
            TextFormField(
              initialValue: cow.cowNumber,
              autofocus: true,
              keyboardType: TextInputType.number,
              onChanged: (String inputCowNumber) {
                cow.changeCowNumberText(inputCowNumber);
              },
            ),
            TextFormField(
              initialValue: cow.locale,
              onChanged: (String inputLocale) {
                cow.changeLocaleText(inputLocale);
              },
            ),
            RaisedButton(
              child: isEdit ? Text('保存') : Text('追加'),
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
