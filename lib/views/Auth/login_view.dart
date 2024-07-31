import 'package:cjowner/services/auth/auth_service.dart';
import 'package:cjowner/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    try {
      String? token = await AuthService.applogin(username, password);

      setState(() {
        _isLoading = false;
      });

      if (token != null) {
        // Store the token
        await AuthService.storeToken(token);

        // Navigate to Home Screen
        GoRouter.of(context).go('/home');
        
      } else {
        // Show error message if login fails
        showSnackbar(context, 'Invalid Credentials, please try again');
      }
    } catch (e) {
      // Handle network or parsing error
      setState(() {
        _isLoading = false;
      });

      showSnackbar(context, 'An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/logo.jpeg',
              height: 180,
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text('Admin Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ))),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  hintText: 'Password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MaterialButton(
                    onPressed: _login,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    color: Colors.black,
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
