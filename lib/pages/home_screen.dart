import'package:flutter/material.dart';
import 'package:shopping_cart/constants.dart';
import 'package:shopping_cart/pages/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Theme.of(context).primaryColor ,
        title: Text('Shopping Cart',style: TextStyle(color: kWhite())),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
          }, icon: Icon(Icons.shopping_bag_outlined,color: kWhite(),)),
        ],
      ),
    );
  }
}
