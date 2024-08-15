import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:other/sign_in.dart';
import 'package:other/widgets/auth_button.dart';
import 'authentication/firebase_auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;
  bool isSigning = false;
  FirebaseAuthService authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
   _emailController.dispose();
   _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define custom color with 30% opacity
    const Color customGreyColor = Color(0xD9D9D9D9); // D9D9D9 with 30% opacity

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30), // Space for status bar
              const Center(
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontSize: 26, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B8FAC),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Increased space
              const Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18), // Increased space
              TextField(
                style: const TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Full Name',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Increased border radius
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Increased space
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Increased space
              TextField(
                obscureText: _obscureText,
                controller: _passwordController,
                style: const TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Increased border radius
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText ? Colors.blue : Colors.black, // Update icon color
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Increased space
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12), // Increased space
              TextField(
                controller: _emailController,
                style: const TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Increased border radius
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Increased space
              const Text(
                'Mobile Number',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12), // Increased space
              TextField(
                style: const TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Increased border radius
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text(
              //       'Sign Up',
              //       style: TextStyle(color: Colors.white, fontSize: 18), // Increased font size
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Color(0xFF0B8FAC),
              //       padding: EdgeInsets.symmetric(horizontal: 155, vertical: 28), // Increased padding
              //       textStyle: TextStyle(
              //         fontSize: 18, // Increased font size
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              AuthButton(
                  text: "Sign Up",
                  onPressed: _signUp,
                  isSigning: isSigning),
              const SizedBox(height: 10), // Increased space
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16, // Increased font size
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30), // Increased space
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.apple, size: 60, color: Colors.black), // Increased icon size
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20), // Increased space
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook, size: 50, color: Color(0xFF1877F2)), // Increased icon size
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20), // Increased space
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google, size: 50, color: Color(0xFF4285F4)), // Increased icon size
                      onPressed: () {
                        authService.signInWithGoogle();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30), // Increased space
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.grey, fontSize: 16), // Increased font size
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: const TextStyle(
                          color: Color(0xFF0B8FAC),
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Increased font size
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _signUp() async {
    setState(() {
      isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    bool signedUp = await authService.signUpWithEmailAndPassword(email, password);
    if(signedUp){
      Navigator.pop(context);
    }
      setState(() {
        isSigning = false;
      });

  }
}
