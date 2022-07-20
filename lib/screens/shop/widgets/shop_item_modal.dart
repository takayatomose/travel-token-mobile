import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopItemModal extends StatelessWidget {
  const ShopItemModal({Key? key, required this.item, required this.blocContext})
      : super(key: key);
  final BuildContext blocContext;
  final Item item;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopBloc>(
      create: (context) => BlocProvider.of<ShopBloc>(blocContext),
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          return Scaffold(
              appBar: PreferredSize(
                  preferredSize:
                      const Size.fromHeight(50.0), // here the desired height
                  child: AppBar(
                    centerTitle: false,
                    backgroundColor: Colors.white,
                    leading: IconButton(
                      icon: const Icon(Icons.west, color: Colors.black),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )),
              body: Center(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(22),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: const Color(0xff1E985E),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Text(item.price.toString() + "SOL",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)))),
                    Padding(
                        padding: const EdgeInsets.all(48),
                        child: Image.network('https://picsum.photos/200',
                            fit: BoxFit.fitWidth)),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 48),
                        child: Text(item.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ))),
                    FractionallySizedBox(
                        widthFactor: 0.75,
                        child: Column(children: [
                          Row(children: [
                            const Expanded(
                                child: Text("Efficiency",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ))),
                            Text(item.efficiency.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                          ]),
                          const SizedBox(height: 20),
                          Row(children: [
                            const Expanded(
                                child: Text("Durability",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ))),
                            Text(item.durability.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                          ]),
                          const SizedBox(height: 20),
                          Row(children: [
                            const Expanded(
                                child: Text("Luck",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ))),
                            Text(item.durability.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                          ]),
                          const SizedBox(height: 20),
                          Row(children: [
                            const Expanded(
                                child: Text("Durability",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ))),
                            Text(item.durability.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                          ]),
                        ])),
                    const SizedBox(height: 54),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 32),
                            primary: const Color(0xffFF8008),
                            shape: const StadiumBorder()),
                        onPressed: () {
                          context.read<ShopBloc>().add(BuyItem(itemId: item.id));
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Buy now',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white),
                        ))
                  ],
                ),
              )));
        },
      ),
    );
    //   },
    // );
  }
}
