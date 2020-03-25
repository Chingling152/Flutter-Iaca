import "package:flutter/material.dart";
import 'package:iaca/models/products/sandwich/sandwich.dart';
import 'package:iaca/providers/sandwich.provider.dart';

class Product extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new ProductState();
}

class ProductState extends State<StatefulWidget>{

  Future<List<Sandwich>> futureSandwichs;

  @override
  void initState(){
    super.initState();
    //futureSandwichs = SandwichProvider().getAllAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child:Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: FutureBuilder(
                future: futureSandwichs,
                builder: (context,sandwichs){
                  if(sandwichs.connectionState != ConnectionState.done){
                    return Text("Carregando");
                  }

                  if(sandwichs.hasData){
                    return GridView.builder(
                        itemBuilder: (context,index){
                          return Container(
                            padding: EdgeInsets.all(10)
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3,
                            childAspectRatio: 3
                        )
                    );
                  }

                  return Text("AAA");
                },
            )
        ,
        )
    );
  }
}