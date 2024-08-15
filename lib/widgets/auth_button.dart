import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key,
        required this.text,
        required this.onPressed,
        required this.isSigning});
  final bool isSigning;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0B8FAC),
            minimumSize: const Size(double.infinity, 65),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: onPressed,
        child: isSigning
            ? const CircularProgressIndicator(color: Colors.white,)
            : Text(
          text,
          style: const TextStyle(fontSize: 20,color: Colors.white),
        ));
  }
}