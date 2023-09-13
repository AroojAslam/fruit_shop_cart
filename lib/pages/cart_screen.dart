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
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 10,left: 15,right: 15),
                    decoration: BoxDecoration(
                      color: value.cartItems[index][4],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:Row(
                      children: [

                        Image(
                            height:80,
                            width: 80,
                            image: NetworkImage(value.cartItems[index][3])),
                      SizedBox(width: 10,),
                       Container(
                         width: 90,

                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(value.cartItems[index][0],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16)),
                             Text('1 '+value.cartItems[index][1],),
                             Text(value.cartItems[index][2]+' Rs'),
                           ],
                         ),
                       ),
                        Container(
                          margin: EdgeInsets.only(top: 15,bottom: 15,),
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                child: TextButton(
                                  onPressed: () {
                                    value.updateItemQuantity(index, 1);
                                  },
                                  child: Text('+'),
                                ),
                              ),
                              Text(value.updateItemQuantity(index, 0).toString()),
                             Container(
                                 height: 35,
                                 width: 35,
                               child:  TextButton(
                                   onPressed: (){
                                     value.updateItemQuantity(index, -1);
                                   }, child: Text('-')),
                             ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
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
