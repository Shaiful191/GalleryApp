import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../moduels/classes.dart' as ima;
import '../widgets/my_input_screen.dart';
import 'package:galleryapp/screen/detailsscreen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.pushNamed(context, MyInputScreen.routeName);
        },
        child: Icon(
          Icons.image,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text("My gallery"),
      ),
      body:

          FutureBuilder(
            future: Provider.of<ima.ImageFile>(context,listen: false).fatchImage(),
            builder: (ctx,snapshot)=>snapshot.connectionState==ConnectionState.waiting?
            Center(
              child: CircularProgressIndicator(),)

                :Consumer<ima.ImageFile>(
              child: Center(child: Text('Start adding your story')),
              builder: (ctx, image, ch) => image.items.length <= 0
                  ? ch
                  : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: GridTile(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, DetailsScreen.routeName,arguments: image.items[i].id);
                          },
                          child: Image.file(
                            image.items[i].image,
                            fit: BoxFit.cover,
                          )),
                    ),
                    footer: GridTileBar(
                      leading: Text(
                        image.items[i].title,
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      title: Text(''),
                      subtitle: Text(image.items[i].id),
                    ),
                  ),
                ),
                itemCount: image.items.length,
              ),
            )
          )
    );



  }
}
