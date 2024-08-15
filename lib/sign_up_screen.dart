import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:other/sign_in.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define custom color with 30% opacity
    final Color customGreyColor = Color(0xD9D9D9D9); // D9D9D9 with 30% opacity

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30), // Space for status bar
              Center(
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontSize: 26, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B8FAC),
                  ),
                ),
              ),
              SizedBox(height: 20), // Increased space
              Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18), // Increased space
              TextField(
                style: TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Full Name',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Increased border radius
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20), // Increased space
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Increased space
              TextField(
                obscureText: _obscureText,
                style: TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
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
              SizedBox(height: 20), // Increased space
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12), // Increased space
              TextField(
                style: TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Increased border radius
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20), // Increased space
              Text(
                'Mobile Number',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12), // Increased space
              TextField(
                style: TextStyle(fontSize: 18), // Increased font size
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  filled: true,
                  fillColor: customGreyColor, // Updated fill color
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0), // Increased height
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Increased border radius
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30), // Increased space
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 18), // Increased font size
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0B8FAC),
                    padding: EdgeInsets.symmetric(horizontal: 155, vertical: 28), // Increased padding
                    textStyle: TextStyle(
                      fontSize: 18, // Increased font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Increased space
              Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16, // Increased font size
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 30), // Increased space
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.apple, size: 60, color: Colors.black), // Increased icon size
                      onPressed: () {},
                    ),
                    SizedBox(width: 20), // Increased space
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.facebook, size: 50, color: Color(0xFF1877F2)), // Increased icon size
                      onPressed: () {},
                    ),
                    SizedBox(width: 20), // Increased space
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.google, size: 50, color: Color(0xFF4285F4)), // Increased icon size
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30), // Increased space
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.grey, fontSize: 16), // Increased font size
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Color(0xFF0B8FAC),
                          fontWeight: FontWeight.bold,
                          fontSize: 16, // Increased font size
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()),
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
}
