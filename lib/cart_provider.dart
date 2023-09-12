import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {

  final List _items=[
    ['Apple','KG','70','https://png.monster/wp-content/uploads/2022/02/png.monster-206.png',Colors.red.shade900.withOpacity(0.1)],
    ['Banana','Dozen','150','https://freepngimg.com/thumb/banana/22-banana-png-image.png',Colors.yellow.shade300.withOpacity(0.1)],
    ['Strawberry','KG','150','https://www.pngall.com/wp-content/uploads/2016/05/Strawberry-Download-PNG.png',Colors.brown.shade900.withOpacity(0.1)],
    ['Pineapple','KG','120','https://www.pngall.com/wp-content/uploads/2016/05/Pineapple-Free-Download-PNG.png',Colors.pink.shade900.withOpacity(0.1)],
    ['Watermelon','KG','250','https://freepngimg.com/save/613-watermelon-png-image/3551x2599',Colors.purple.shade900.withOpacity(0.1)],
    ['Kiwi','KG','260','https://www.pngmart.com/files/1/Kiwi-Fruit-PNG.png',Colors.orange.shade900.withOpacity(0.1)],
    ['Blueberry','KG','160','https://pngimg.com/d/blueberries_PNG21.png',Colors.blue.shade900.withOpacity(0.1)],
    ['Mango','KG','200','https://www.freepnglogos.com/uploads/mango-png/mango-png-image-purepng-transparent-png-image-25.png',Colors.teal.shade900.withOpacity(0.1)]
  ];
  get shopItem => _items;
  List _cartItems =[];
  get cartItems => _cartItems;
  void addCardItems(int index){
    _cartItems.add(_items[index]);
    notifyListeners();
  }
  void removeCardItems(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  String calculate(){
    double total=0;
    for(int i=0;i<_cartItems.length;i++){
     total +=double.parse(_cartItems[i][2]);
     notifyListeners();
    }
    return total.toStringAsFixed(1);
  }
}