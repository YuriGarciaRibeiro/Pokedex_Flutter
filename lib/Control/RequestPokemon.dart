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
  

  //função para pegar o pokemon pelo link
  Future<Map<String, dynamic>> getPokemonByUrl(String url) async{
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> body = convert.jsonDecode(response.body);

    return body;
  }




  //função para pegar todos os tipos de pokemons
  Future<Map<String, dynamic>> getTypes() async{
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/type'));
    Map<String, dynamic> body = convert.jsonDecode(response.body);

    return body;
  }


  //funçao para pegar a especie do pokemon
  Future<Map<String, dynamic>> getSpecies(String url) async{
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> body = convert.jsonDecode(response.body);

    return body;
  }


  //função para pegar a cadeia evolutiva do pokemon
  Future<Map<String, dynamic>> getEvolutionChain(String url) async{
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> body = convert.jsonDecode(response.body);
    return body;
  }

}