import'package:flutter/material.dart';
import 'package:shopping_cart/constants.dart';
import 'package:shopping_cart/pages/cart_screen.dart';
import 'package:badges/badges.dart' as badges;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> productName = ['Apple','Banana', 'Strawberry', 'Pineapple', 'Watermelon', 'Kiwi','Blueberry','Mango'];
  List<String> productUnit = ['KG', 'Dozen', 'KG', 'KG', 'KG','KG','Kg','KG'];
  List<int> productPrice = [50, 90, 105, 120, 60,160,120,90];
  List<String> productImage = [
    'https://w7.pngwing.com/pngs/265/75/png-transparent-ipod-touch-apple-icon-format-icon-large-red-apples-closeup-of-red-apples-natural-foods-food-eating.png',
    'https://freepngimg.com/thumb/banana/22-banana-png-image.png',
    'https://www.pngall.com/wp-content/uploads/2016/05/Strawberry-Download-PNG.png',
    'https://www.pngall.com/wp-content/uploads/2016/05/Pineapple-Free-Download-PNG.png',
    'https://freepngimg.com/save/613-watermelon-png-image/3551x2599',
    'https://www.pngmart.com/files/1/Kiwi-Fruit-PNG.png',
    'https://pngimg.com/d/blueberries_PNG21.png',
    'https://www.freepnglogos.com/uploads/mango-png/mango-png-image-purepng-transparent-png-image-25.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Theme.of(context).primaryColor ,
        title: Text('Shopping Cart',style: TextStyle(color: kWhite())),
        actions: [
          badges.Badge(
           badgeStyle: badges.BadgeStyle(badgeColor: kWhite()),
            position: badges.BadgePosition.topEnd(top: 1,end: 1),
            badgeContent: Text('3'),
            child:IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
            }, icon: Icon(Icons.shopping_bag_outlined,color: kWhite(),)),
          ),
           SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
              return Card(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            height:100,
                              width: 100,
                          image: NetworkImage(productImage[index].toString())),
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(productName[index].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                               SizedBox(height: 5,),
                               Text('1 '+productUnit[index].toString()+' = '+productPrice[index].toString(),
                                   style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                               Align(
                                 alignment: Alignment.centerRight,
                                 child: ElevatedButton(
                                   style: ButtonStyle(
                                     surfaceTintColor:MaterialStateProperty.all(kWhite()) ,
                                   ),
                                   onPressed: (){}, child: Text('Add to Cart'),
                                 ),
                               ),
                             ],
                           ),
                         ),

                        ],
                      ),
                    ],
                  ),
                ) ,
              );
            },),
          ),
        ],
      ),
    );
  }
}
