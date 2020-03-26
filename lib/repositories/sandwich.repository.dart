import 'dart:convert';

import 'package:iaca/models/products/sandwich/sandwich.dart';
import 'package:iaca/providers/sandwich.provider.dart';


//transforma os dados do sandubão ficarem top
class SandwichRepository{

  SandwichProvider _provider;

  SandwichRepository(){
    _provider = SandwichProvider();
  }

  Future<List<Sandwich>> getAll() async {
    var result = await _provider.getAll();
    return result.map(((sandwich) =>  Sandwich.fromJson(sandwich))).toList();
  }

  Future createSandwich(Sandwich sandwich) async{
    var newSandwich = utf8.encode(json.encode(sandwich));
    return await _provider.createSandwich(newSandwich);
  }

}