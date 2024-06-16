import 'package:flutter/material.dart';
import 'package:flutter_application/auth/auth_service.dart';
import 'package:flutter_application/pages/profile_page.dart';
import 'package:flutter_application/pages/settings_page.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer ({super.key});

  void logout(){
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
               SizedBox(
                height: 180,
                child: Center(
                  child: Icon(
                    Icons.fitness_center,
                    color: Colors.green.shade400,
                    size: 80,
                  ),
                ),
              ),

              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context); //pop the drawer
                  },
                ),
              ),

              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context); //pop the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(), // navigate to settings page
                      ),
                    );
                  },
                ),
              ),

              //profile list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: const Text("P R O F I L E"),
                  leading: const Icon(Icons.account_circle),
                  onTap: () {
                    Navigator.pop(context); //pop the drawer
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(), // navigate to profile page
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          //log out list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 50),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: (logout),
            ),
          ),
        ],
      ),
    );
  }
  
}