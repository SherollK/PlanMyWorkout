import 'package:flutter/material.dart';
import 'package:flutter_application/components/my_card.dart';
import 'package:flutter_application/components/my_drawer.dart';
import 'package:flutter_application/pages/tracker_page.dart';
import 'package:flutter_application/pages/weather_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleTextStyle: TextStyle(fontSize: 18,color: Theme.of(context).colorScheme.primary),
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: const [
          MyCard(
            title: 'Tracker',
            subtitle: 'Check off your workouts for the day!',
            icon: Icons.track_changes,
            navigateTo: TrackerPage(),
          ),
          MyCard(
            title: 'Weather',
            subtitle: 'Plan your run with real-time weather updates!',
            icon: Icons.cloudy_snowing,
            navigateTo: WeatherPage(),
          ),
        ],
      ),
    );
  }
}