import 'package:flutter/material.dart';

class EWalletScreen extends StatelessWidget {
  const EWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Create Wallet'))
              ]),
        ),
      ),
    );
  }
}
