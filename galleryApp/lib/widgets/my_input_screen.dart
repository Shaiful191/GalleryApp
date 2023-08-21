import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryapp/moduels/classes.dart';
import 'package:galleryapp/widgets/image_input.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class MyInputScreen extends StatefulWidget {
  static const routeName = "MyInputScreen";
  @override
  State<MyInputScreen> createState() => _MyInputScreenState();
}

class _MyInputScreenState extends State<MyInputScreen> {
  final _titleController = TextEditingController();
  final _storyController = TextEditingController();

  File savedImage;
  void savedImages(File image) {
    savedImage = image;
  }

  void onSave() {
    if (_titleController.text.isEmpty ||
        _storyController.text.isEmpty ||
        savedImage == null) {
      return;
    } else {
      Provider.of<ImageFile>(context, listen: false)
          .addImagePlace(_titleController.text, _storyController.text, savedImage);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
        actions: [
          IconButton(
            onPressed: onSave,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: _storyController,
                decoration: InputDecoration(
                  labelText: 'Story',
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ImageInput(savedImages),
            ],
          ),
        ),
      ),
    );
  }
}
