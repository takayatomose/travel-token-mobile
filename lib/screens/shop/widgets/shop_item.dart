import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffff), width: 1),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0)),
                  color: Color(0xfff3f3f3),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      item.price.toString() + "SOL",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w700),
                    )),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: const Text('BUY',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700)),
                          onPressed: () {
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.transparent,
                                transitionDuration: Duration(milliseconds: 200),
                                pageBuilder: (BuildContext context,
                                    Animation first, Animation second) {
                                  return ShopItemModal(item: item);
                                });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffFF8008), // background
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                              )),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Flexible(
            flex: 75,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Image.network('https://picsum.photos/100'),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(item.name.toUpperCase(),
                          style: TextStyle(fontSize: 12))),
                  Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                          'E${item.eficiency.toString()} D${item.durability.toString()} L${item.luck.toString()} D${item.distance.toString()} ',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xffABABAB)))),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                color: Color(0xff022134),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
