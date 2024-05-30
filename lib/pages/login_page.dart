import 'package:flutter/material.dart';
import 'package:flutter_application/components/my_button.dart';
import 'package:flutter_application/components/my_textfield.dart';

class LoginPage extends StatelessWidget {

  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //navigate to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login () {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.fitness_center,
              size: 90,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 30),
          
            //welcome back message
            Text(
              "Back for more gains? Let's do this!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14,               
              ),
            ),

            const SizedBox(height: 25),
        
            //email textfield
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController
            ),

            const SizedBox(height: 10),
        
            //password textfield
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 25),
        
            //login button
            MyButton(
              text: "Login",
              onTap: login,
            ),
            
            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: 
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now!",
                    style: 
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),


          ],
        ),
      )
    );
  }
}