import 'package:dio/dio.dart';
import 'package:pokemon/domain/model/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon?> getPokemon({required int idPokemon});
}

class PokemonRepPoke extends PokemonRepository {
  final dio = Dio();
  final path = "https://pokeapi.co/api/v2/pokemon/";
  Pokemon? pokemon;

  ///se utiliza para extraer data de [path]
  @override
  Future<Pokemon?> getPokemon({required int idPokemon}) async {
    final response = await dio.get("$path$idPokemon");
    pokemon = Pokemon.fromJson(response.data);
    return pokemon;
  }
}
