import 'package:bookstore/pages/cart.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart=[
    {
      "name":"Saket",
      "picture":"images/1.jpg",
      "price":100,
      "quantity": 1,
    },
    {
      "name":"Saket",
      "picture":"images/1.jpg",
      "price":100,
      "quantity": 1,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context,index){
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]['name'],
            cart_prod_picture: Products_on_the_cart[index]["color"],
            cart_prod_price: Products_on_the_cart[index]['price'],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
          );

        });
  }
}


class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;

  Single_cart_product({this.cart_prod_name,this.cart_prod_picture,this.cart_prod_price,this.cart_prod_qty
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        leading: Image.asset(cart_prod_picture,width: 80,height: 80,),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Expanded(
//                  child: Text("Quantity:"),
//                )
//              ],
//            )
          Text("\$${cart_prod_price}",style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),
            )
          ],
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_drop_up),onPressed: (){},
            ),
            Text("$cart_prod_qty" ),
            IconButton(
              icon: Icon(Icons.arrow_drop_down),onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
