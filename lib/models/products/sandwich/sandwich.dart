import 'package:iaca/models/products/sandwich/ingredients.dart';

class Sandwich{
  String id;
  String name;
  List<Ingredients> ingredients;
  double price;

  Sandwich({this.id,this.ingredients,this.name,this.price});

  factory Sandwich.fromJson(Map<String,dynamic> json){
    var ingr = json["ingredients"];
    return Sandwich(
        id:json["id"],
        name:json["name"],
        ingredients: List<Ingredients>.from(ingr.map((i) =>Ingredients.fromJson(i))),
        price: json["price"].toDouble()
    );
  }

  Map<String,dynamic> toJson() =>{
    'id':this.id,
    'name':this.name,
    'ingredients':this.ingredients,
    'price':this.price
  };
}
