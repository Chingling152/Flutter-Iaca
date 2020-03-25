import "package:flutter/material.dart";
import 'package:http/http.dart' as api;
import 'dart:async';
import 'dart:convert';


class Products extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new ProductsState();
}

class ProductsState extends State<StatefulWidget>{

  @override
  void initState(){
    super.initState();
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

              //List<Product> productList = products.data;
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
                    );
                  },
              );
            }else{
              return Text("Carregando...");
            }

            },
        )
    )
    );
  }
}