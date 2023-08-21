
import 'package:flutter/material.dart';
import 'package:galleryapp/moduels/classes.dart' as ima;
import 'package:provider/provider.dart';


class DetailsScreen extends StatelessWidget {
  static const routeName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {
    final imageId = ModalRoute.of(context).settings.arguments as String;
    final image =
        Provider.of<ima.ImageFile>(context, listen: false).findImage(imageId);

    return Scaffold(
      appBar: AppBar(
        title: Text(image.title),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            height: 400,
            width: double.infinity,
            child: Image.file(
              image.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            image.title,
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            image.story,
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
