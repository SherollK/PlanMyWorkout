import 'package:flutter/material.dart';

class TrackerPage extends StatelessWidget {
  const TrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleTextStyle: TextStyle(fontSize: 18,color: Theme.of(context).colorScheme.primary),
        title: const Text("Tracker"),       
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
    );
  }
}