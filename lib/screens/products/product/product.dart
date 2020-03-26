import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:iaca/models/products/sandwich/ingredients.dart';
import 'package:iaca/models/products/sandwich/sandwich.dart';
import 'package:iaca/repositories/ingredients.repository.dart';
import 'package:iaca/repositories/sandwich.repository.dart';
import 'package:iaca/screens/products/product/customProduct.dart';

class Product extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new ProductState();
}

class ProductState extends State<StatefulWidget>{

  SandwichRepository sandRepos;
  IngredientsRepository ingrRepos;

  Sandwich sandwich;
  Future<List<Ingredients>> futureIngredients;

  @override
  void initState(){
    super.initState();
    ingrRepos = IngredientsRepository();
    futureIngredients = ingrRepos.getAll();

    sandRepos = SandwichRepository();
    sandwich= Sandwich(ingredients: List(0),name: "",price:0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          title: Text("Ver sandubas"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.launch),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>CustomProduct()
                      )
                  );
                }
                )
          ],
        ),
      body:Material(
                child:Container(
        child:Column(
            children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child:
                  Form(
                  autovalidate: true,
                  child:Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Nome do seu sanduiche"),
                        Container(
                          width: 200,
                          padding: EdgeInsets.only(left: 10),
                          child: TextField(
                            onChanged:(String val)=>setState((){
                              sandwich.name=val;
                            }) ,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 300,
                      height: 200,
                      child: FutureBuilder(
                          future: futureIngredients,
                          builder: (context,snapshot){
                            if(snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasData) {
                                List<Ingredients> ingredients = snapshot.data;
                                return GridView.builder(
                                    itemCount: ingredients.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10
                                    ),
                                    itemBuilder: (context, index) {
                                        return Container(
                                          height: 312,
                                          width: 312,
                                          padding: EdgeInsets.all(20),
                                          child:Container(
                                            child:Image.network(
                                                    ingredients[index].urlImage??"https://static.thenounproject.com/png/340719-200.png",
                                                    height: 312,
                                                    width: 312
                                              )
                                            )
                                          );
                                    }
                                );
                              }
                              return Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                                  color: Colors.white70,
                                  child: Text(
                                    "Vazio",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  )
                              );
                            }
                            return Center(
                              heightFactor: 500,
                              child: Column(
                                children: <Widget>[
                                  Text("Carregando..."),
                                  CircularProgressIndicator()
                                ],
                              ),
                            );
                        },
                      ),
                    )
                  ],
                )
              )
            ),
              Padding(
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                  child: Text("aaaa"),
                ),
              ),

            Container(
                    child: Text(sandwich.name??""),
                  ),
            Container(
              width: 312,
              height: 312,
              child: GridView.builder(
                  itemCount: sandwich.ingredients?.length??0 ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                  itemBuilder: (context,index){
                    return Padding(
                        padding: EdgeInsets.all(20),
                        child:Image.network(
                            sandwich.ingredients[index].urlImage??"https://static.thenounproject.com/png/340719-200.png",
                            height: 312,
                            width: 312
                        )
                    );
                  }
              ),
            )
          ]
        )
        )
      )
    );
  }
}