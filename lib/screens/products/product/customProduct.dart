import "package:flutter/material.dart";
import 'package:iaca/models/products/sandwich/sandwich.dart';
import 'package:iaca/repositories/sandwich.repository.dart';

class CustomProduct extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new CustomProductState();
}

class CustomProductState extends State<StatefulWidget>{

  SandwichRepository repos;
  Future<List<Sandwich>> futureSandwiches;

  @override
  void initState(){
    super.initState();
    repos = SandwichRepository();
    futureSandwiches = repos.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: Text("Ver sandubas"),
      ),
        body:Container(
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
                          width: 200,
                          height: 100,
                          color: Colors.grey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                  child:Text(
                                    sandwichList[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  )
                              )
                              ,
                              ListView.builder(
                                shrinkWrap: true,
                                    itemCount: sandwichList[index].ingredients.length,
                                    itemBuilder: (BuildContext ctx, int ingredient) {
                                      return Container(
                                          padding: EdgeInsets.only(top:5),
                                          color: Colors.white10,
                                          child: Text(
                                                    sandwichList[index].ingredients[ingredient].name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black
                                                    )
                                                )
                                      );
                                    }
                                )
                            ],
                          )
                        );
                      },
                      itemCount: sandwichList.length
                  );
                }else{
                  return Padding(
                    padding: EdgeInsets.all(30),
                    child: Center(
                      heightFactor: 500,
                      child: Column(
                        children: <Widget>[
                          Text("Carregando..."),
                          CircularProgressIndicator()
                        ],
                      ),
                    )
                  );
                }
              },
              future: futureSandwiches,
            )
        )
    );
  }
}