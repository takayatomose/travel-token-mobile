import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/items/my_items_screen.dart';

class MyItemNavigator extends StatelessWidget {
  const MyItemNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [MaterialPage(child: MyItemsScreen())],
    );
  }
}
