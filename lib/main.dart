import 'package:flutter/material.dart';
import 'package:flutter_signal/signals/config.signal.dart';
import 'package:signals_flutter/signals_flutter.dart';

void main() {
  runApp(SignalProvider(child: const MyApp(), create: () => configSignal));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var config = configSignal.watch(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Signals',
      theme: config.darkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: const BodyView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            configSignal.set(
              config.copyWith(
                name: "breiner sn",
                counter: 1,
                darkMode: false,
              ),
            );
          },
          child: const Icon(
            Icons.change_circle,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class BodyView extends StatelessWidget {
  const BodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var config = configSignal.watch(context);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              configSignal.set(
                config.copyWith(
                  darkMode: !config.darkMode,
                ),
              );
            },
            icon: Icon(config.darkMode ? Icons.dark_mode : Icons.light_mode,
                size: 70)),
        Text(
          config.name,
          style: const TextStyle(fontSize: 30),
        ),
        ElevatedButton(
            style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.all(20))),
            onPressed: () {
              configSignal.set(
                config.copyWith(
                  name: "breiner ${config.counter + 1}",
                  counter: config.counter + 1,
                ),
              );
            },
            child: Text(
              "+${config.counter}",
              style: const TextStyle(fontSize: 30),
            ))
      ],
    ));
  }
}
