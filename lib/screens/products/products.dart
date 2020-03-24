import "package:flutter/material.dart";
import 'package:http/http.dart' as api;
import 'dart:async';
import 'dart:convert';

import 'package:iaca/models/product.dart';
// useful :


class Products extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new ProductState();
}

class ProductState extends State<StatefulWidget>{
  Future<List<Product>> futureProducts;

  @override
  void initState(){
    super.initState();
    futureProducts = getProducts();
  }

  Future<List<Product>> getProducts() async{
    final response = await
    api.get('http://5e7934d0491e9700162de8b7.mockapi.io/api/iaca-products');

    switch(response.statusCode){
      case 200:
        Iterable list = json.decode(utf8.decode(response.bodyBytes));
        return list.map( (product) => Product.fromJson(product)).toList();
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
    child:Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child:FutureBuilder(
          builder: (context,products){
            if(products.connectionState == ConnectionState.done) {

              if (!products.hasData) {
                return Container(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    color: Colors.white70,
                    child: Text(
                      "Sem produtos",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
                );
              }

              List<Product> productList = products.data;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20
                  ),
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey,
                      child: Column(
                        children: <Widget>[
                          Text(
                              productList[index].name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 12,
                                color: Colors.black,
                                decorationStyle: null
                              ),
                          ),
                          Container(
                            child: Image.network(
                              productList[index].imageUrl,
                              height: 100,width:100
                            )
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: productList.length
              );
            }else{
              return Text("Carregando...");
            }

            },
          future: futureProducts,
        )
    )
    );
  }
}