import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 65),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 27),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Login to your account to keep traveling',
                  textAlign: TextAlign.center,
                ),
              ),
              _emailField(),
              _passwordField(),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.topRight,
                child: InkWell(
                  child: const Text(
                    'Forgot password?',
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60)),
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text('Or connect using'),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 30),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12)),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook_sharp,
                          size: 27,
                        ),
                        label: const Text(
                          'Facebook',
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12)),
                      onPressed: () {},
                      icon: const Icon(
                        MdiIcons.google,
                        size: 27,
                      ),
                      label:
                          const Text('Google', style: TextStyle(fontSize: 18))),
                ]),
              ),
              RichText(
                  text: TextSpan(
                      text: 'Don\'t have account? ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return const Padding(
              padding: EdgeInsets.only(bottom: 11),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    hintText: 'Input your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            );
  }

  Widget _emailField() {
    return const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Input your email address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            );
  }
}
