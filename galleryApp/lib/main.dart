import 'package:flutter/material.dart';
import 'package:galleryapp/screen/my_home_page.dart';
import 'package:provider/provider.dart';
import 'moduels/classes.dart';
import 'screen/detailsscreen.dart';
import 'widgets/my_input_screen.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>ImageFile(),
      child: MaterialApp(
        title: "Flutter Gallery",
        theme: ThemeData.dark(),
        home : MyHomePage(),
        routes: {
          MyInputScreen.routeName:(ctx)=>MyInputScreen(),
          DetailsScreen.routeName:(ctx)=>DetailsScreen(),
        },

      ),
    );
  }
}

