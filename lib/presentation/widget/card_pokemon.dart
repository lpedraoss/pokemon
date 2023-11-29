import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/common/pokemon.enum.dart';

import 'package:pokemon/bloc/pokemon_selection/pokemon_selection_bloc.dart';
import 'package:pokemon/data/service/pokemon_service.dart';
import 'package:pokemon/domain/model/pokemon.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon({super.key});

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  int _counter = 1;
  Pokemon? pokemon;
  late PokemonSelectionBloc _pokemonSelectBloc;
/*   String? namePokemon; */
  void _getPokemon({PokemonSelectionState? status}) async {
    status != null
        ? status.selectedPoke == PokemonStatus.nextPoke
            ? _counter++
            : status.selectedPoke == PokemonStatus.beforePoke
                ? _counter > 1
                    ? _counter--
                    : null
                : null
        : null;
    pokemon = await PokemonService().getPokemon(idPokemon: _counter);
    setState(() {});
  }

  @override
  void initState() {
    _pokemonSelectBloc = context.read<PokemonSelectionBloc>();
    _pokemonSelectBloc.stream.listen((state) {
      _getPokemon(status: state);
    });

    _getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonSelectionBloc, PokemonSelectionState>(
      builder: (context, statusButton) {
        return Center(
          child: pokemon?.name == null
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      pokemon!.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    if (pokemon != null) ...[
                      Image.network(pokemon!.sprites.frontDefault),
                      Image.network(pokemon!.sprites.backDefault)
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: (() =>
                              beforePressedPoke(context: context)),
                          tooltip: 'Decrement',
                          child: const Icon(Icons.minimize_outlined),
                        ),
                        Text(
                          '$_counter',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        FloatingActionButton(
                          onPressed: (() => nextPressedPoke(context: context)),
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  nextPressedPoke({BuildContext? context}) {
    var pokemonSelectBloc = context!.read<PokemonSelectionBloc>();
    pokemonSelectBloc.add(const NextPokemonEvent());
  }

  beforePressedPoke({BuildContext? context}) {
    var pokemonSelectBloc = context!.read<PokemonSelectionBloc>();
    pokemonSelectBloc.add(const BeforePokemonEvent());
  }
}
