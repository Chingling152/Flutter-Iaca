import 'dart:convert';
import 'package:iaca/apiServices/api.dart';

const DEFAULT_ENDPOINT = "http://5e7934d0491e9700162de8b7.mockapi.io/api/";

//fornece retornos
class SangaClient{

  Http _http;

  dynamic _authorizationToken;
  dynamic _customHeaders;
  dynamic _apiKey;

  SangaClient({url = DEFAULT_ENDPOINT,authorizationToken,customHeaders,apiKey}){
    _http = Http(url);
    _authorizationToken = authorizationToken;
    _apiKey = apiKey;//isso sim ;-;
    //_customHeaders = customHeaders;//isso não existe
  }

  get({endpoint:""}) async{
    var response = await _http.fetchAsync(endpoint,"GET",authorizationToken:_authorizationToken,customHeaders:{"key":_apiKey});
    switch(response.statusCode){
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
        break;
    }
    throw Exception();//criar nossas proprias exceções?
  }

  post({endpoint:"",String authorizationToken,Map customHeaders,body}) async{
    var response = await _http.fetchAsync(endpoint,"POST",authorizationToken:_authorizationToken,customHeaders:{"key":_apiKey},body:body);
    switch(response.statusCode){
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
        break;
    }
    throw Exception();
  }

  put({endpoint:"",String authorizationToken,Map customHeaders,body}) async{
    var response = await _http.fetchAsync(endpoint,"PUT",authorizationToken:authorizationToken,customHeaders:{"key":_apiKey},body:body);
    switch(response.statusCode){
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
        break;
    }
    throw Exception();
  }

  delete({endpoint:"",String authorizationToken,Map customHeaders}) async{
    var response = await _http.fetchAsync(endpoint,"DELETE",authorizationToken:authorizationToken,customHeaders:{"key":_apiKey});
    switch(response.statusCode){
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
        break;
    }
    throw Exception();
  }
}
