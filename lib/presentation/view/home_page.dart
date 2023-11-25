import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/counter/counter_cubit.dart';
import 'package:pokemon/presentation/widget/card_pokemon.dart';
import 'package:pokemon/utils/status.enum.dart';

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
    return BlocBuilder<CounterCubit, Status>(
      builder: (context, statusButton) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
            body: Column(
              children: [
                const CardPokemon(),
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
