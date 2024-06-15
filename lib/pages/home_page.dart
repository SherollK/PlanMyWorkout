import 'package:flutter/material.dart';
import 'package:flutter_application/components/main_card.dart';
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
        titleTextStyle: TextStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.primary),
        title: Row(
          mainAxisSize: MainAxisSize
              .min, 
          children: [
            Icon(Icons.home,
                color: Theme.of(context).colorScheme.primary), 
            const SizedBox(width: 8), 
            const Text("Home"),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: const [
          SizedBox(height: 46), 
          MainCard(),
          SizedBox(height: 46),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Get started on your fitness goals.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
          ),
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