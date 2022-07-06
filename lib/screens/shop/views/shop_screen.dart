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
          title: const Text('Welcome to Xtrip shop',
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.left),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                    padding: EdgeInsets.only(top: 8, left: 21),
                    child: Text('Have a nice shopping',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left)),
              ),
            ),
            CategoryList(),
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
