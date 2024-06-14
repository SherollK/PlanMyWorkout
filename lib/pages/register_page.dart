import 'package:flutter/material.dart';
import 'package:flutter_application/auth/auth_service.dart';
import 'package:flutter_application/components/my_button.dart';
import 'package:flutter_application/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {

  //email and pw controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  //navigate to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //register method
  void register (BuildContext context) {
    //get auth service
    final auth  = AuthService();

    //passwords match -> create user
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    //passwords do not match
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Center(
            child: Text(
              "Passwords Don't Match",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              const SizedBox(height: 150),
              //logo
              Icon(
                Icons.fitness_center,
                size: 90,
                color: Theme.of(context).colorScheme.primary,
              ),
        
              const SizedBox(height: 20),
            
              //welcome message
              Text(
                "Ready to begin? Register now!",
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
        
              const SizedBox(height: 10),
        
              //confirm password textfield
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController,
              ),
        
              const SizedBox(height: 25),
          
              //register button
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),
              
              const SizedBox(height: 25),
        
              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: 
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login Now",
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
        ),
      )
    );
  }
}