import 'package:iaca/models/products/sandwich/ingredients.dart';
import 'package:iaca/providers/ingredients.provider.dart';

class IngredientsRepository{
  IngredientsProvider _provider;

  IngredientsRepository(){
    _provider = IngredientsProvider();
  }

  Future<List<Ingredients>> getAll() async{
    var result = await _provider.getAll();
    return result.map(((ingredient) =>  Ingredients.fromJson(ingredient))).toList();
  }
}
