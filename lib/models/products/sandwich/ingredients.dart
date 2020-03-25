class Ingredients {
  String id;
  String name;
  String urlImage;
  double price;

  Ingredients({this.id,this.name,this.price,this.urlImage});

  factory Ingredients.fromJson(Map<String,dynamic> json){
    return Ingredients(
      id:json["id"],
      name:json["name"],
      urlImage: json["urlImage"],
      price: json["price"].toDouble()
    );
  }

  Map<String,dynamic> toJson() =>{
    'id':this.id,
    'name':this.name,
    'urlImage':this.urlImage,
    'price':this.price
  };
}