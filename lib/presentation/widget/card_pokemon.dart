import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/counter/counter_cubit.dart';
import 'package:pokemon/data/service/pokemon_service.dart';
import 'package:pokemon/domain/model/pokemon.dart';
import 'package:pokemon/utils/status.enum.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon({super.key});

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  int _counter = 1;
  Pokemon? pokemon;
/*   String? namePokemon; */
  void _getPokemon({required Status? status}) async {
    status == Status.increment
        ? _counter++
        : status == Status.decrement
            ? _counter > 1
                ? _counter--
                : null
            : null;
    pokemon = await PokemonService().getPokemon(idPokemon: _counter);
    setState(() {
/*       namePokemon = pokemon?.name ?? "no conection"; */
    });
  }

  @override
  void initState() {
    var initialStatus = Status.inProcess;
    _getPokemon(status: initialStatus);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, Status>(
      builder: (context, statusButton) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                pokemon?.name ?? 'no data',
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
                    onPressed: (() => {
                          setState(
                            () {
                              statusButton = CounterCubit().counterDecrement();
                            },
                          ),
                          _getPokemon(status: statusButton)
                        }),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.minimize_outlined),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  FloatingActionButton(
                    onPressed: (() => {
                          setState(
                            () {
                              statusButton = CounterCubit().counterIncrement();
                            },
                          ),
                          _getPokemon(status: statusButton)
                        }),
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
}
