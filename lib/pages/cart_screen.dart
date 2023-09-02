import'package:flutter/material.dart';
import 'package:shopping_cart/constants.dart';
import 'home_screen.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar:AppBar(
        backgroundColor:Theme.of(context).primaryColor ,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        },icon: Icon(Icons.keyboard_backspace_sharp,color: kWhite(),)),
        automaticallyImplyLeading: false,
        title: Text('Shopping Cart',style: TextStyle(color: kWhite())),
      ),
    );
  }
}
