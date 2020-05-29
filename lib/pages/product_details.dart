import 'package:flutter/material.dart';
import 'package:bookstore/main.dart';
import 'home.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({this.product_detail_name,this.product_detail_new_price,this.product_detail_old_price,this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          title: InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
              child: Text('Book Store')),
          backgroundColor: Colors.teal,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
          ],
        ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(widget.product_detail_name),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                       child: Text("\$${widget.product_detail_old_price}",
                       style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),
                       )
                      ),
                      Expanded(
                          child: Text("\$${widget.product_detail_new_price}")
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Quantity"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("Quantity"),
                        content: Text("Choose the Quantity"),
                        actions: <Widget>[
                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: Text('Close'),
                          )
                        ],
                      );
                    }
                    );
                  },

                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy Now")
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart,
                color: Colors.red,),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border,
                color: Colors.red,),
                onPressed: (){},
              )
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Detail'),
            subtitle: Text(''),
          ),
//          Divider(),
//          Row(
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
//                child: Text("Product name",style: TextStyle(color: Colors.grey),),
//              ),
//              Padding(padding: EdgeInsets.all(5),
//              child: Text(widget.product_detail_name),
//              )
//
//            ],
//          ),
          Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Similar Products'),
        ),
        Container(
          height: 360,
            child: Similar_products(),
        )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {

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
    }



  ];


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context,int index){
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}
class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  Similar_Single_prod({this.prod_name,this.prod_old_price,this.prod_picture,this.prod_price});

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



