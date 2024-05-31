import 'package:flutter/material.dart';
import 'package:flutter_application/auth/auth_service.dart';
import 'package:flutter_application/components/box.dart';
import 'package:flutter_application/components/button.dart';
import 'package:flutter_application/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  void logout(){
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          //logout button
          IconButton(onPressed: logout, icon: const Icon(Icons.logout),)
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.primary,
          child: Mybutton(
            color: Theme.of(context).colorScheme.secondary,
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}