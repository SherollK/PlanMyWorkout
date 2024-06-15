import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context){
    return  GNav(
      gap: 8, 
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Theme.of(context).colorScheme.primary,
      activeColor: Theme.of(context).colorScheme.tertiary,
      mainAxisAlignment: MainAxisAlignment.center,
      tabs: const[
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.track_changes,
          text: 'Tracker',
        ),
        GButton(
          icon: Icons.cloudy_snowing,
          text: 'Weather',
        ),
        GButton(
          icon: Icons.account_circle,
          text: 'Profile',
        ),
      ],
    );
  }
}