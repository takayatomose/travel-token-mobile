import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffe7e7e7), width: 1),
        borderRadius: BorderRadius.all(
            Radius.circular(16) //                 <--- border radius here
            ),
      ),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 20,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffff), width: 1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                color: Color(0xfff3f3f3),
              ),
            ),
          ),
          Flexible(
            flex: 65,
            child: Container(
              color: Colors.blue,
              child:  Image.network('https://picsum.photos/250?image=9'),
            ),
          ),
          Flexible(
            flex: 15,
            child: Container(
               decoration: BoxDecoration(
                border: Border.all(color: Color(0xff022134), width: 1),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
                color: Color(0xffff),
              ),
            ),
          )
        ],
      ),
    );
  }
}
