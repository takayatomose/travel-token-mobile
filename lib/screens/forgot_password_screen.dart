import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 28),
                child: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: RichText(
                    text: TextSpan(
                        text:
                            'Input your registered email address, we will send you the link to reset your password.Please check your email and follow instructions. ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: 'Need helps?',
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                    ])),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 35),
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Input your email address',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Send reset link'))
            ],
          )),
    );
  }
}
