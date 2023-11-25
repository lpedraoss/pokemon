import 'package:pokemon/data/repository/pokemon_repository.dart';
import 'package:pokemon/domain/model/pokemon.dart';

class PokemonService {
  final repository = PokemonRepPoke();
  Pokemon? pokemon;
  Future<Pokemon?> getPokemon({required int idPokemon}) async {
    pokemon = await repository.getPokemon(idPokemon: idPokemon);
    return pokemon;
  }
}
