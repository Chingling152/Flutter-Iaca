import 'package:iaca/apiServices/SangaClient.dart';

class IngredientsProvider{
  SangaClient _client;

  IngredientsProvider(){
    _client = new SangaClient(url:"http://5e7934d0491e9700162de8b7.mockapi.io/api/iaca-ingredients");
  }

  Future<List<dynamic>> getAll() async {
    return await _client.get();
  }
}

class IngredientsDevProvider extends IngredientsProvider{

  IngredientsDevProvider(){
    _client = new SangaClient(
        url:"https://5e7934d0491e9700162de8b7.mockapi.io/api/iaca-ingredients",
        apiKey: "API KEY"
    );
  }

  Future<List<dynamic>> getAll() async{
    return await _client.get() as List<dynamic>;
  }
}
