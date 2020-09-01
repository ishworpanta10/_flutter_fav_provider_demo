import 'package:add_toFav_with_provider/model/favModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
      ),
      body: Consumer<FavQuote>(
        builder: (context, value, child) => value.favList.isEmpty
            ? Center(
                child: Text('No Fav Yet !!'),
              )
            : ListView.builder(
                itemCount: value.favList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(value.favList[index].quote),
                    subtitle: Text(value.favList[index].author),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      onPressed: () {
                        value.removeFav(index);
                        print("Removed Quote  : ${index.toString()}");
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
