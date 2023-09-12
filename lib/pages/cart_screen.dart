import'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_provider.dart';
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
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        },icon: Icon(Icons.keyboard_backspace_sharp,color: Theme.of(context).primaryColor,)),
        automaticallyImplyLeading: false,
        title: Text('Shopping Cart',style: TextStyle(color: Theme.of(context).primaryColor)),
      ),
      body:Column(
        children: [
          Expanded(
            child:Consumer<CartProvider>(
              builder: (context, value, child) {
                return  ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: value.cartItems[index][4],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [
                        SizedBox(width: 20,),
                        Image(
                            height:80,
                            width: 80,
                            image: NetworkImage(value.cartItems[index][3])),
                      SizedBox(width: 20,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(value.cartItems[index][0],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                           Text('1 '+value.cartItems[index][1],),
                           Text(value.cartItems[index][2]+' Rs'),
                         ],
                       ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                             child:  IconButton(onPressed: () {
                               value.removeCardItems(index);
                             },icon: Icon(Icons.cancel,color: Theme.of(context).primaryColor.withOpacity(0.6),)),
                            ),
                          ),
                        )
                      ],
                    )
                  );
                },);
              },
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Container(
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Items:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                            SizedBox(height: 5,),
                            Text('Total Payment:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      SizedBox(width: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(value.cartItems.length.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                            SizedBox(height: 5,),
                            Text(value.calculate()+' Rs',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Expanded(child: Align(
                        alignment: Alignment(0,0),
                        child: ElevatedButton(onPressed: (){},
                            child: Text('Buy')),))
                    ],
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}
