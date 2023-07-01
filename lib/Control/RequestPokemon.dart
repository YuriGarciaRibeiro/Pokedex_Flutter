import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class RequestPokemon{
  String baseUrl = 'https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0';
  String searchUrl = 'https://pokeapi.co/api/v2/pokemon/';






  Future<Map<String, dynamic>> getPokemons(String url) async{
    baseUrl = url;

    final response = await http.get(Uri.parse(baseUrl));
    Map<String, dynamic> body = convert.jsonDecode(response.body);

    return body;
  }

    Future<Map<String, dynamic>> getPokemonByNunber(int nunber) async{
    
    final response = await http.get(Uri.parse(searchUrl+nunber.toString()));
    Map<String, dynamic> body = convert.jsonDecode(response.body);

    return body;
  }


}