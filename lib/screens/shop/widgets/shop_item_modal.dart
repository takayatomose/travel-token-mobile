import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';

class ShopItemModal extends StatelessWidget {
  const ShopItemModal({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.west, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )),
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(22),
        color: Colors.white,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color(0xff1E985E),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(item.price.toString() + "SOL",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
            Padding(
                padding: EdgeInsets.all(48),
                child: Image.network('https://picsum.photos/200',
                    fit: BoxFit.fitWidth)),
            Padding(
                padding: EdgeInsets.only(bottom: 48),
                child: Text(item.name.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ))),
            FractionallySizedBox(
                widthFactor: 0.75,
                child: Column(children: [
                  Row(children: [
                    Expanded(
                        child: Text("Eficiency",
                            style: TextStyle(
                              fontSize: 14,
                            ))),
                    Text(item.eficiency.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                  ]),
                  SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                        child: Text("Durability",
                            style: TextStyle(
                              fontSize: 14,
                            ))),
                    Text(item.durability.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                  ]),
                  SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                        child: Text("Luck",
                            style: TextStyle(
                              fontSize: 14,
                            ))),
                    Text(item.durability.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                  ]),
                  SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                        child: Text("Durability",
                            style: TextStyle(
                              fontSize: 14,
                            ))),
                    Text(item.durability.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )),
                  ]),
                ])),
            SizedBox(height: 54),
            ElevatedButton(
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    primary: Color(0xffFF8008),
                    shape: StadiumBorder()),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      )),
    );
  }
}
