import 'package:pokemon_api/models/pokemon_detail_model.dart';
import 'package:pokemon_api/repositories/poke_repository.dart';

class PokeDetailsController {
  PokeRepository pokeRepository;
  PokeDetailsController({
    required this.pokeRepository,
  });

  Future<PokemonModel> findPokemon(String pokemon) async {
    return await pokeRepository.findPokemon(pokemon);
  }
}
