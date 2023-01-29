import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_api/repositories/poke_repository.dart';
import '../constans/app_named_routes.dart';
import '../models/pokemon_detail_model.dart';

class PokeController {
  final PokeRepository _pokeRepository;
  PokeController(
    this._pokeRepository,
  );
  final controllerText = TextEditingController();
  bool? inLoader;
  List<PokemonModel> pokemons = [];

  Future<List<PokemonModel>> fetchPokemons() async {
    inLoader = true;
    var result = await _pokeRepository.getPokemons(pokemons.length);
    pokemons.addAll(result);
    inLoader = false;
    return pokemons;
  }

  searchPokemon() {
    Modular.to.pushNamed(AppNamedRoutes.detailsPage, arguments: {
      'id': controllerText.text,
    });
  }
}
