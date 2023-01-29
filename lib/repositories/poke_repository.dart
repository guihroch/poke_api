import 'package:dio/dio.dart';
import '../models/pokemon_detail_model.dart';

class PokeRepository {
  Future<List<PokemonModel>> getPokemons(int numberPokemons) async {
    var url =
        'https://pokeapi.co/api/v2/pokemon?offset=$numberPokemons&limit=20';
    var dio = Dio();
    try {
      final response = await dio.get(url);
      final List listPokemon = response.data['results'];

      return listPokemon.map((e) => PokemonModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('error');
    }
  }

  Future<PokemonModel> findPokemon(String pokemon) async {
    var url = 'https://pokeapi.co/api/v2/pokemon/$pokemon';

    var dio = Dio();
    try {
      final response = await dio.get(url);
      final PokemonModel model = PokemonModel.fromJson(response.data);

      return model;
    } catch (e) {
      throw Exception('error');
    }
  }
}
