import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ShopBloc shopBloc = ShopBloc(httpClient: http.Client());
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  void initState() {
    shopBloc.add(FetchCategories());
    shopBloc.add(FetchItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => shopBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('WELCOME TO XTRIP SHOP',
              style: TextStyle(color: Colors.black), textAlign: TextAlign.left),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(top: 8, left: 21),
                  child: Text('Have a nice shopping',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left)),
            ),
            const CategoryList(),
            DropdownButton(
              // Initial Value
              // value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  // dropdownvalue = newValue!;
                });
              },
            ),
            Expanded(
              // wrap in Expanded
              child: ItemList(),
            ),
          ],
        ),
      ),
    );
  }
}
