import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup.dart'; // Import the Signup page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  Future<void> _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the home page after successful login
      Navigator.pushReplacementNamed(context, '/home');
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
                  height: 667,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: const Color.fromRGBO(149, 186, 221, 0.22),
                  ),
                ),
              ),
              const Positioned(
                top: 55,
                left: 117,
                child: Text(
                  'LOGIN',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Positioned(
                top: 172,
                left: 53,
                child: Text(
                  'Username or Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 199,
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
                        hintText: 'Enter your username or email',
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 313,
                left: 53,
                child: Text(
                  'Password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Comfortaa',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 338,
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
              Positioned(
                top: 485,
                left: 109,
                child: ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.25),
                    minimumSize: const Size(154, 51),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 555,
                left: 50,
                child: TextButton(
                  onPressed: () {
                    // Navigate to the Signup page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: const Text(
                    'Don’t have an account? Sign Up\nForgot password?',
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
                  top: 650,
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
