import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/common/pokemon.enum.dart';
part 'pokemon_selection_event.dart';
part 'pokemon_selection_state.dart';

class PokemonSelectionBloc
    extends Bloc<PokemonSelectionEvent, PokemonSelectionState> {
  PokemonSelectionBloc() : super(PokemonInit()) {
    const next = PokemonStatus.nextPoke;
    const before = PokemonStatus.beforePoke;
    on<NextPokemonEvent>((event, emit) {
      emit(PokemonSelected(next));
    });
    on<BeforePokemonEvent>((event, emit) {
      emit(PokemonSelected(before));
    });
  }
}
