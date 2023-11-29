import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/color_settings/color_settings_bloc.dart';
import 'package:pokemon/bloc/pokemon_selection/pokemon_selection_bloc.dart';
import 'package:provider/provider.dart';
import 'routes/navigation_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PokemonSelectionBloc(),
            ),
            BlocProvider(
              create: (_) => ColorSettingsBloc(),
              /* child: const HellowScreen(), */
            ),
          ],
          child: MaterialApp(
            title: 'PokeView',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const NavigationControl(),
          ),
        ),
      ],
    );
  }
}
