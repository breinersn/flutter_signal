import 'package:signals_flutter/signals_flutter.dart';

class Config {
  String name;
  int counter;
  bool darkMode;

  Config({
    required this.name,
    required this.counter,
    required this.darkMode,
  });

  Config copyWith({
    String? name,
    int? counter,
    bool? darkMode,
  }) {
    return Config(
        name: name ?? this.name,
        counter: counter ?? this.counter,
        darkMode: darkMode ?? this.darkMode);
  }
}

final configSignal = signal<Config>(Config(
  name: "breiner sn",
  counter: 1,
  darkMode: false,
));
