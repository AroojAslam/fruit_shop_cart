

import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90,),
            Image(
              width: 250,
                height: 250,
                image: AssetImage('assets/images/start.png')),
            SizedBox(height: 40,),
            Text('We deliver\ngrocery at your\ndoorstep',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,
                color: Theme.of(context).primaryColor,fontWeight: FontWeight.w600)),
            SizedBox(height: 20,),
            Text('You can buy your favorite fruits and enjoy\nthem at home without going outside.',textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.4),)),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            }, child: Text("Let\'s Shop Now"))
          ],
        ),
      ),
    );
  }
}
