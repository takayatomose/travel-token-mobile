import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key, required this.item}) : super(key: key);

  final Item item;
  showItemDetail(context, item) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => ShopItemModal(item: item, blocContext: context),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffe7e7e7), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 20,
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0x0000ffff), width: 1),
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16.0)),
                      color: const Color(0xfff3f3f3),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "${item.price}SOL",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        )),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                showItemDetail(context, item);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color(0xffFF8008), // background
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                              child: const Text('BUY',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  showItemDetail(context, item);
                },
                child: Flexible(
                  flex: 75,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Image.network('https://picsum.photos/100'),
                        Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(item.name.toUpperCase(),
                                style: const TextStyle(fontSize: 12))),
                        Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                                'E${item.efficiency.toString()} D${item.durability.toString()} L${item.luck.toString()} D${item.distance.toString()} ',
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xffABABAB)))),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Container(
                    decoration: const BoxDecoration(
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
      },
    );
  }
}
