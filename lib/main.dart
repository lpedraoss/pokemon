import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/counter/counter_cubit.dart';
import 'package:pokemon/routes/navigation_control.dart';
import 'package:provider/provider.dart';

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
              create: (context) => CounterCubit(),
            ),
          ],
          child: MaterialApp(
            title: 'PokeView',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
              useMaterial3: true,
            ),
            home: const NavigationControl(),
          ),
        ),
      ],
    );
  }
}
