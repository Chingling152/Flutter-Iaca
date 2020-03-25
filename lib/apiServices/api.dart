import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


const DEFAULT_ENDPOINT = "http://5e7934d0491e9700162de8b7.mockapi.io/api/";

class ApiServices{
  String apiurl;
  ApiServices({apiurl}){
    this.apiurl = DEFAULT_ENDPOINT + apiurl;
  }

  Future<dynamic> getAllAsync() async{
    final response = await
    http.get(apiurl);

    switch(response.statusCode){
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
        break;
    }
    return null;
  }
}

//fornece metodos
class Http {

  String _url;

  Http(this._url);
  // body pode ser : string , map<string,string> ou list<>
  Future<Response> fetchAsync(String endpoint, String method,
      {authorizationToken,customHeaders, body}) async{

    var headers ={
      "Accept": "application/json",
      "Content-Type":"application/json"
    };

    if(authorizationToken != null){
      headers["Authorization"] = "Bearer " + authorizationToken;
    }

    if (customHeaders != null) {
      for(var header in customHeaders.entries){
        headers[header.key] = header.value;
      }
    }

    if(body != null){
      body = json.encode(body);
    }

    switch(method.toUpperCase()){
      case "POST":
        return http.post(_url + endpoint,headers: headers,body:body??null);
      case "PUT":
        return http.put(_url + endpoint,headers: headers,body:body??null);
      case "DELETE":
        return http.delete(_url + endpoint,headers: headers);
      case "GET":
      default:
        return http.get(_url + endpoint,headers: headers);
    }
    //HttpClient client = new HttpClient();
    //client.get(host, port, path)
  }
}

