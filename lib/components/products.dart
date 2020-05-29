import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/pages/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list=[
    {
      "name":"Saket",
      "picture":"images/1.jpg",
      "old_price":"128",
      "price":"100",
    },
    {
      "name":"Saket1",
      "picture":"images/1.jpg",
      "old_price":"228",
      "price":"200",
    },
    {
      "name":"Saket1",
      "picture":"images/1.jpg",
      "old_price":"228",
      "price":"200",
    },
    {
      "name":"Saket1",
      "picture":"images/1.jpg",
      "old_price":"228",
      "price":"200",
    },
    {
      "name":"Saket1",
      "picture":"images/1.jpg",
      "old_price":"228",
      "price":"200",
    },
    {
      "name":"Saket1",
      "picture":"images/1.jpg",
      "old_price":"228",
      "price":"200",
    }



  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
      });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Single_prod({this.prod_name,this.prod_old_price,this.prod_picture,this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("Hero 1"),
          child: Material(
            child: InkWell(
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(
                //here we are passing the values to product detail page
                product_detail_name: prod_name,
                product_detail_new_price: prod_price,
                product_detail_old_price: prod_old_price,
                product_detail_picture: prod_picture,

              ))),
              child: GridTile(
                footer: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Text("\$${prod_price}",style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),)
                    ],
                  )
                ),
                child: Image.asset(prod_picture,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),),
    );
  }
}

