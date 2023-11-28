part of 'color_settings_bloc.dart';

abstract class ColorSettingsEvent {
  const ColorSettingsEvent();
}

class SetRedColorEvent extends ColorSettingsEvent {
  const SetRedColorEvent();
}

class UnsetRedColorEvent extends ColorSettingsEvent {
  const UnsetRedColorEvent();
}
