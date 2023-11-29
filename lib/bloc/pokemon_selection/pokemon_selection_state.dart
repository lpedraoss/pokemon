part of 'pokemon_selection_bloc.dart';

abstract class PokemonSelectionState {
  PokemonStatus selectedPoke;
  PokemonSelectionState(this.selectedPoke);
}

class PokemonSelected extends PokemonSelectionState {
  PokemonSelected(super.selectedPoke);
}

class PokemonInit extends PokemonSelectionState {
  PokemonInit() : super(PokemonStatus.initPoke);
}
