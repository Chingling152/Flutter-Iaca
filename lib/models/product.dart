import 'package:iaca/models/prices.dart';

class Product{
  String id;
  String name;
  String description;
  Prices prices;
  String imageUrl;

  Product({this.id,this.name,this.description,this.imageUrl,this.prices});//construtor pronto

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id:json["id"],
      name:json["name"]?? "Produto sem nome",
      description: json["description"]?? "Sem descrição disponivel",
      prices: Prices.fromJson(json["prices"]),
      imageUrl: json["imageUrl"]
    );
  }
}

