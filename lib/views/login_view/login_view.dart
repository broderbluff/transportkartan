import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({
    super.key,
  });

// Initialize Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Create controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 500,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Du är inte inloggad'),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onFieldSubmitted: (value) async {
                try {
                  final UserCredential user = await _auth.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  // User logged in
                  // Navigate to next screen or show a success message
                } catch (e) {
                  // Handle login error
                  // Show an error message
                }
              },
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Lösenord',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              obscureText: true, // Hide password input
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Logga in'),
              onPressed: () async {
                try {
                  final UserCredential user = await _auth.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  // User logged in
                  // Navigate to next screen or show a success message
                } catch (e) {
                  // Handle login error
                  // Show an error message
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
