import 'package:flutter/cupertino.dart';

class Quote {
  final String quote;
  final String author;

  Quote({this.quote, this.author});
}

List<Quote> quoteList = [
  Quote(author: 'Ishwor', quote: 'This is quote 1'),
  Quote(author: 'Sashita', quote: 'This is quote 2'),
  Quote(author: 'Sudhmite', quote: 'This is quote 3'),
  Quote(author: 'Ramesh', quote: 'This is quote 4'),
  Quote(author: 'Gita', quote: 'This is quote 5'),
];

class FavQuote with ChangeNotifier {
  List<Quote> favList = [];

  // addTofav(Quote quote) {
  //   favList.add(quote);
  //   notifyListeners();
  // }

  addRemoveFav(Quote quote , int index) {
    if (favList.contains(quote)) {
      favList.removeAt(index);
    } else {
      favList.add(quote);
    }
    notifyListeners();
  }

  removeFav(int index) {
    favList.removeAt(index);
    notifyListeners();
  }
}
