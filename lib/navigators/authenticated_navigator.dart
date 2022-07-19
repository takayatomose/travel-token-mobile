import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/custom_map_screen.dart';
import 'package:xtrip_mobile/screens/items/my_item_navigator.dart';
import 'package:xtrip_mobile/screens/shop/views/shop_screen.dart';
import 'package:xtrip_mobile/screens/user_settings/user_navigation.dart';
import 'package:xtrip_mobile/screens/wallet/main_wallet_screen.dart';
import 'package:xtrip_mobile/screens/wallet/wallet_navigator.dart';

class AuthenticatedNavigator extends StatefulWidget {
  const AuthenticatedNavigator({Key? key}) : super(key: key);

  @override
  State<AuthenticatedNavigator> createState() => _AuthenticatedNavigatorState();
}

class _AuthenticatedNavigatorState extends State<AuthenticatedNavigator> {
  int _selectedIndex = 2;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Repair',
    ),
    MyItemNavigator(),
    CustomMap(),
    ShopScreen(),
    UserNavigator(),
    WalletNavigator(),
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
            icon: const Icon(Icons.settings_outlined),
            label: S.of(context).repair,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.card_travel_outlined),
            label: S.of(context).items,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            label: S.of(context).map,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: S.of(context).shop,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outlined),
            label: S.of(context).account,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
