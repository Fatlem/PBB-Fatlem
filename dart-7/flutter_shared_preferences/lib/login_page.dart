import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _storedUsername;
  String? _storedPassword;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedUsername = prefs.getString('username');
      _storedPassword = prefs.getString('password');
    });
  }

  _registerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
    setState(() {
      _storedUsername = _usernameController.text;
      _storedPassword = _usernameController.text;
    });
  }

  _loginUser() {
    if (_usernameController.text == _storedUsername &&
        _passwordController.text == _storedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama Lengkap'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            if (_storedUsername == null || _storedPassword == null) ...[
              ElevatedButton(
                onPressed: _registerUser,
                child: Text('Submit'),
              ),
            ] else ...[
              ElevatedButton(
                onPressed: _loginUser,
                child: Text('Login'),
              ),
            ],
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _nameController.clear();
                _usernameController.clear();
                _passwordController.clear();
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
