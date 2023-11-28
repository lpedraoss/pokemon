import 'package:flutter_bloc/flutter_bloc.dart';
part 'color_settings_event.dart';
part 'color_settings_state.dart';

class ColorSettingsBloc extends Bloc<ColorSettingsEvent, ColorSettingsState> {
  ColorSettingsBloc() : super(ColorSettingsState(false)) {
    on<SetRedColorEvent>((event, emit) {
      emit(ColorSettingsState(true));
    });
    on<UnsetRedColorEvent>((event, emit) {
      emit(ColorSettingsState(false));
    });
  }
}
