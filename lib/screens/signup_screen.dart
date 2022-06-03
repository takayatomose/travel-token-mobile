import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onCreate() {}
    return Scaffold(
      body: Center(
          child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 17),
              child: Text(
                'Let\'s Get Started',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                'Create an account to get earning while traveling',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.people_alt),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Your full name'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: 'Your email address')),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Your password'),
                obscureText: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Confirm your password'),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 60),
                    primary: const Color.fromRGBO(46, 46, 46, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => onCreate(),
                child: const Text(
                  'Create',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Center(
                child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text: 'By creating the account, you agree with our ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Terms and Conditions',
                            style:
                                const TextStyle(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ]),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text('Already had account?'),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: const Text(
                  'Login with us',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ))
          ],
        ),
      )),
    );
  }
}
