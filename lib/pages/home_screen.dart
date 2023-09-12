import'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/pages/cart_screen.dart';
import 'package:badges/badges.dart' as badges;
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
        actions: [
          Consumer<CartProvider>(builder: (context, value, child) {
            return badges.Badge(
              badgeStyle: badges.BadgeStyle(badgeColor:Theme.of(context).primaryColor ),
              position: badges.BadgePosition.topEnd(top: 1,end: 1),
              badgeContent: Text(value.cartItems.length.toString(),style: TextStyle(color:Colors.white)),
              child:IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
              }, icon: Icon(Icons.shopping_bag_outlined,)),
            );
          },),
           SizedBox(width: 20,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text('Let\'s order fruits \n for you',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor)),
            ),
            Expanded(child:
            Consumer<CartProvider>(builder: (context, value, child) {
              return GridView.builder(

                itemCount: value.shopItem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.75),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10,left: 5,right: 5),
                    decoration: BoxDecoration(
                        color: value.shopItem[index][4],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5,),
                        Image(
                          height:80,
                            width: 80,
                            image: NetworkImage(value.shopItem[index][3])),
                        SizedBox(height: 5,),
                        Text(value.shopItem[index][0],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                        SizedBox(height: 5,),
                        Text('1 '+value.shopItem[index][1]+':'+value.shopItem[index][2]+' Rs',),
                        SizedBox(height: 5,),
                        ElevatedButton(onPressed: (){
                         value.addCardItems(index);
                        }, child: Text('Add to Cart')),
                        SizedBox(height: 5,),

                      ],
                    ),
                  );
                },);
            },)
            )
          ],
        ),
      ),
    );
  }
}
