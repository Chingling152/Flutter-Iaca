class Prices{
  double small;
  double medium;
  double big;

  Prices({this.small,this.medium,this.big});

  factory Prices.fromJson(Map<String,dynamic> json){
    return Prices(
      small:  json["small"].toDouble(),
      medium: json["medium"].toDouble(),
      big:json['big'].toDouble()
    );
  }
}