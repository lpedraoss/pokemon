part of 'pokemon_selection_bloc.dart';

abstract class PokemonSelectionEvent {
  const PokemonSelectionEvent();
}

class NextPokemonEvent extends PokemonSelectionEvent {
  const NextPokemonEvent();
}

class BeforePokemonEvent extends PokemonSelectionEvent {
  const BeforePokemonEvent();
}
