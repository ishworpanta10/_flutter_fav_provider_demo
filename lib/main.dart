import 'package:add_toFav_with_provider/favScreen.dart';
import 'package:add_toFav_with_provider/model/favModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavQuote>(
      create: (context) => FavQuote(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title here"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavScreen(),
                ),
              );
            },
          )
        ],
        centerTitle: true,
        elevation: 0.0,
        titleSpacing: 1.2,
      ),
      body: Container(
        child: Consumer<FavQuote>(
          builder: (context, value, child) => ListView.builder(
              itemCount: quoteList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(quoteList[index].quote),
                  subtitle: Text(quoteList[index].author),
                  trailing: IconButton(
                    icon: value.favList.contains(quoteList[index])
                        ? Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      value.addRemoveFav(quoteList[index], index);
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
