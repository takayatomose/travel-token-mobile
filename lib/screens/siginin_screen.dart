import 'package:flutter/material.dart';

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
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Input your email address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 11),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: 'Input your password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
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
                    onPressed: () {}, child: const Text('Login')),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text('Or connect using'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
