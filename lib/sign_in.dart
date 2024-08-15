import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:other/sign_up_screen.dart';
import 'package:other/widgets/auth_button.dart';
import 'package:other/widgets/notif.dart';
import 'authentication/firebase_auth_service.dart';
import 'home_screen.dart'; // Import the HomeScreen

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  FirebaseAuthService authService = FirebaseAuthService();
  bool isSigning = false;
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
    const Color customGreyColor = Color(0xD9D9D9D9);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B8FAC),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter your email and password to login to your account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  style: const TextStyle(fontSize: 18),
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    filled: true,
                    fillColor: customGreyColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  obscureText: _obscureText,
                  controller: _passwordController,
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    filled: true,
                    fillColor: customGreyColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: _obscureText ? Colors.blue : Colors.black,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Forgot Password'),
                        content: const Text('Password reset instructions have been sent to your email.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              AuthButton(
                  text: "Sign In",
                  onPressed: _signIn,
                  isSigning: isSigning
              ),
              // Center(
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //     child: ElevatedButton(
              //       onPressed: () {
              //         // Navigate to HomeScreen
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => HomeScreen()),
              //         );
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: const Color(0xFF0B8FAC),
              //         minimumSize: const Size(double.infinity, 80),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12.0),
              //         ),
              //       ),
              //       child: const Text(
              //         'Sign In',
              //         style: TextStyle(color: Colors.white, fontSize: 18),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.apple, size: 60, color: Color(0xFF000000)),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook, size: 50, color: Color(0xFF1877F2)),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google, size: 50, color: Color(0xFF4285F4)),
                      onPressed: () {
                        authService.signInWithGoogle();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: Color(0xFF0B8FAC),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;


    bool logged = await authService.signInWithEmailAndPassword(
        email, password);

    if(logged){
      showToast("Successfully Logged in");
    }

    setState(() {
      isSigning = false;
    });
  }

}
