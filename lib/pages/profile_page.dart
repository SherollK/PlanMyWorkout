import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _currentPasswordController =
      TextEditingController();

  Future<void> _reauthenticateAndChangePassword() async {
    try {
      // Get current user
      User? user = _auth.currentUser;
      String email = user!.email!;

      // Re-authenticate the user
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: _currentPasswordController.text,
      );

      await user.reauthenticateWithCredential(credential);

      // Proceed with password update
      await user.updatePassword(_passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update password: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser; // Get the current user
    String? email = user?.email; // Get the user's email

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.primary),
        title: const Text("Profile Page"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //add a profile icon
              Center(
                child:  Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.green.shade400,
                ),
              ),
            const SizedBox(height: 26),         
            if (email != null) // Only display if the email is not null
              
              Row(
                children: [
                  const Text(
                    'Email: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 26),
            TextFormField(
              controller: _currentPasswordController,
              decoration: const InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reauthenticateAndChangePassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400, 
              ),
              child:  Text('Update Password',style: TextStyle(color: Theme.of(context).colorScheme.background),),            
            ),
          ],
        ),
      ),
    );
  }
}
