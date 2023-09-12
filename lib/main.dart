import 'package:flutter/material.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:provider/provider.dart';
import 'pages/start_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CartProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home:const StartScreen(),
    ),
    );
  }
}
