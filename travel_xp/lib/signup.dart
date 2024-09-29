import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_xp/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String? errorMessage;

  Future<void> _signUp() async {
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      setState(() {
        errorMessage = "Passwords do not match";
      });
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // If the user is successfully created, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully Registered!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to the login page after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 236, 248, 1),
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(223, 236, 248, 1),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 104,
                left: 25,
                child: Container(
                  width: 310,
                  height: 664,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: const Color.fromRGBO(149, 186, 221, 0.22),
                  ),
                ),
              ),
              const Positioned(
                top: 53,
                left: 111,
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Positioned(
                top: 157,
                left: 53,
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(149, 186, 221, 0.22),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your username',
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 260,
                left: 53,
                child: Text(
                  'Phone No.',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 293,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(149, 186, 221, 0.22),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your phone number',
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 363,
                left: 53,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 396,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(149, 186, 221, 0.22),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 466,
                left: 53,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 499,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(149, 186, 221, 0.22),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 569,
                left: 53,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 602,
                left: 53,
                child: Container(
                  width: 254,
                  height: 62,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(149, 186, 221, 0.22),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(149, 186, 221, 1),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm your password',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 674,
                left: 109,
                child: ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.25),
                    minimumSize: const Size(154, 51),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 735,
                left: 50,
                child: GestureDetector(
                  onTap: () {
                    // Navigate back to login page
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Already have an account? Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Comfortaa',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              if (errorMessage != null)
                Positioned(
                  top: 800,
                  left: 50,
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
