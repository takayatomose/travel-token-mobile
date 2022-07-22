import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/custom_map_screen.dart';
import 'package:xtrip_mobile/screens/items/my_item_navigator.dart';
import 'package:xtrip_mobile/screens/shop/views/shop_screen.dart';
import 'package:xtrip_mobile/screens/user_settings/user_navigation.dart';

class GamePlayNavigator extends StatefulWidget {
  const GamePlayNavigator({Key? key}) : super(key: key);

  @override
  State<GamePlayNavigator> createState() => _GamePlayNavigatorState();
}

class _GamePlayNavigatorState extends State<GamePlayNavigator> {
  int _selectedIndex = 2;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Repair',
    ),
    MyItemNavigator(),
    CustomMap(),
    ShopScreen(),
    UserNavigator(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_sneaker.png',
                width: 30, height: 30),
            label: S.of(context).repair,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_launch.png',
                width: 30, height: 30),
            label: S.of(context).items,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ic_map.png', width: 30, height: 30),
            label: S.of(context).map,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_shop.png',
              width: 30,
              height: 30,
            ),
            label: S.of(context).shop,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_person.png',
              width: 30,
              height: 30,
            ),
            label: S.of(context).account,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
