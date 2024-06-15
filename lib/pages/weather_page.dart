import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleTextStyle: TextStyle(fontSize: 18,color: Theme.of(context).colorScheme.primary),
        title: const Text("Weather"),       
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
    );
  }
}