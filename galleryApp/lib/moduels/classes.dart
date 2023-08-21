import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'database.dart';

class Image {
  final String id;
  final String title;
  final String story;
  final File image;

  Image({this.image, this.title, this.id, this.story});
}

class ImageFile with ChangeNotifier {
  List<Image> _items = [];
  List<Image> get items {
    return [..._items];
  }

  Future<void> addImagePlace(String title, String story, File image) async {
    final newImage = Image(
        image: image,
        title: title,
        id: DateTime.now().toString(),
        story: story);
    _items.add(newImage);
    notifyListeners();
    DataHelper.insert('user_image', {
      'id':newImage.id,
      'story':newImage.story,
      'image':newImage.image,
      'title':newImage.title,
    });
  }



  Image findImage(String imageId){
    return _items.firstWhere((image) => image.id==imageId);
  }

  Future <void> fatchImage() async{
    final list =await DataHelper.getData('user_image');
    _items=list.map(
        (item)=> Image(
          image: File(item['image']),
          title: item['title'],
          id: item['id'],
          story: item['story'],
        )
    ).toList();
    notifyListeners();
  }


}



