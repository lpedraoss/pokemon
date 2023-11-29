import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_selection/pokemon_selection_bloc.dart';
import 'package:pokemon/presentation/widget/card_pokemon.dart';
import 'package:pokemon/presentation/widget/color_selection.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.onNavigate});

  /// indica que habrá un callback en el cambio de pantalla
  final ValueChanged<String> onNavigate;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonSelectionBloc, PokemonSelectionState>(
      builder: (context, statusButton) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
            body: Column(
              children: [
                const CardPokemon(),
                const ColorBox(),
                ColorSelection(),
                FloatingActionButton(
                  onPressed: () {
                    widget.onNavigate("helloScreen");
                  },
                  child: const Center(
                    child: Text("Next"),
                  ),
                ),
              ],
            )
            // This trailing comma makes auto-formatting nicer for build methods.
            );
      },
    );
  }
}
