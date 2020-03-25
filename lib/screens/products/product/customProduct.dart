import "package:flutter/material.dart";
import 'package:iaca/models/products/sandwich/sandwich.dart';
import 'package:iaca/repositories/sandwich.repository.dart';

class CustomProduct extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new CustomProductState();
}

class CustomProductState extends State<StatefulWidget>{

  Future<List<Sandwich>> futureSandwiches;

  @override
  void initState(){
    super.initState();
    futureSandwiches = SandwichRepository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child:Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child:FutureBuilder(
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done) {

                  if (!snapshot.hasData) {
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

                  List<Sandwich> sandwichList = snapshot.data;
                  return ListView.builder(
                      itemBuilder: (BuildContext ctx, int index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Text(
                                sandwichList[index].name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14,
                                    color: Colors.black
                                ),
                              ),
                              ListView.builder(
                                itemCount: sandwichList[index].ingredients.length,
                                itemBuilder: (BuildContext ctx, int ingredientIndex) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    color: Colors.grey,
                                    child: Column(
                                      children: <Widget>[
                                          Text(
                                            sandwichList[index].ingredients[ingredientIndex].name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black
                                            )
                                        )
                                    ]
                                  )
                                );
                                }
                            )
                            ],
                          ),
                        );
                      },
                      itemCount: sandwichList.length
                  );
                }else{
                  return Text("Carregando...");
                }
              },
              future: futureSandwiches,
            )
        )
    );
  }
}