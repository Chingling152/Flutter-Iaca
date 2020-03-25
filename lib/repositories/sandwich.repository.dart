import 'dart:convert';

import 'package:iaca/models/products/sandwich/sandwich.dart';
import 'package:iaca/providers/sandwich.provider.dart';

class SandwichRepository{

  static Future<List<Sandwich>> getAll() async {
    Iterable result = await SandwichProvider.getAll();
    return result.map(((sandwich) =>  Sandwich.fromJson(sandwich))).toList();
  }

  static Future createSandwich(Sandwich sandwich) async{
    var newSandwich = utf8.encode(json.encode(sandwich));
  }

}