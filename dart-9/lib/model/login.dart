import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final savedUsername = prefs.getString('username');
      final savedPassword = prefs.getString('password');

      if (_usernameController.text == savedUsername && _passwordController.text == savedPassword) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Username atau password salah'),
            backgroundColor: Colors.red,
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loginWithGoogle() async {
    // Implementasi login dengan Google
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF2A65A),
              Color(0xFFD76D2E),
              Color(0xFF7B3E19),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.lock_outline, color: Colors.white, size: 80),
                  SizedBox(height: 20),
                  Text('Welcome Back!', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'DynaPuff')),
                  SizedBox(height: 10),
                  Text('Login to continue', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white70, fontFamily: 'DynaPuff')),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.brown[800]),
                      filled: true,
                      fillColor: Colors.orange[100],
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.brown[800], fontFamily: 'DynaPuff'),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      } else if (value.length < 3) {
                        return 'Username must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.brown[800]),
                      filled: true,
                      fillColor: Colors.orange[100],
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.brown[800], fontFamily: 'DynaPuff'),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: _isLoading ? null : _login,
                    child: _isLoading 
                      ? CircularProgressIndicator() 
                      : Text('Login', style: TextStyle(fontSize: 18, fontFamily: 'DynaPuff')),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text('Belum punya akun? Daftar di sini', style: TextStyle(color: Colors.white70, fontFamily: 'DynaPuff')),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman reset password
                      Navigator.pushNamed(context, '/reset_password');
                    },
                    child: Text('Lupa password?', style: TextStyle(color: Colors.white70, fontFamily: 'DynaPuff')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
