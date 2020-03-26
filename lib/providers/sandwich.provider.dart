import 'package:iaca/apiServices/SangaClient.dart';

//tras dados de um sandubão top
class SandwichProvider{

  SangaClient _client;

  SandwichProvider(){
    _client = new SangaClient(url:"http://5e7934d0491e9700162de8b7.mockapi.io/api/iaca-sandwichs");
  }

  Future<List<dynamic>> getAll() async{
    return await _client.get() as List<dynamic>;
  }

  Future createSandwich(sandwich) async{
    return await _client.post();
  }

}

class SandwichDevProvider extends SandwichProvider{

  SandwichDevProvider(){
    _client = new SangaClient(url:"https://5e7934d0491e9700162de8b7.mockapi.io/api/iaca-sandwichs");
  }

  Future<List<dynamic>> getAll() async{
    return await _client.get() as List<dynamic>;
  }
}
