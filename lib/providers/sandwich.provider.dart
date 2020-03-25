import 'package:iaca/apiServices/SangaClient.dart';

class SandwichProvider{

  static SangaClient _client = new SangaClient(url:"http://5e7934d0491e9700162de8b7.mockapi.io/api/iaca-sandwichs") ;

  static Future<List<Map>> getAll() async{
    return await _client.get();
  }

  static Future createSandwich(sandwich) async{
    return await _client.post();
  }

}