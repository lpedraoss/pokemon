import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/color_settings/color_settings_bloc.dart';

class ColorSelection extends StatefulWidget {
  ColorSelection({Key? key}) : super(key: key);

  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorSettingsBloc, ColorSettingsState>(
      builder: (context, colorSettingsState) {
        return Row(
          children: [
            Checkbox(
                value: colorSettingsState.useRed,
                onChanged: (isChecked) =>
                    {onCheckedBroxPressed(isChecked, context)}),
            const Text("Rojo"),
          ],
        );
      },
    );
  }

  onCheckedBroxPressed(bool? isChecked, BuildContext context) {
    var colorSettingsBloc = context.read<ColorSettingsBloc>();
    isChecked!
        ? colorSettingsBloc.add(const SetRedColorEvent())
        : colorSettingsBloc.add(const UnsetRedColorEvent());
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ColorSettingsBloc, ColorSettingsState>(
        builder: (context, colorSettingsState) => Container(
          color: colorSettingsState.useRed ? Colors.red : Colors.black38,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
        ),
      );
}
