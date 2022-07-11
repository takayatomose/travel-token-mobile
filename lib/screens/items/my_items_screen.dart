import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/items/bloc/my_item_bloc.dart';
import 'package:xtrip_mobile/widgets/map_bottom_sheet/map_bottom_sheet.dart';
import 'package:xtrip_mobile/widgets/user_items/user_items.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({Key? key}) : super(key: key);

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  late MyItemBloc myItemBloc;
  @override
  void initState() {
    super.initState();
    // myItemBloc = BlocProvider.of<MyItemBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyItemBloc()..add(FetchItems()),
      child: BlocConsumer<MyItemBloc, MyItemState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).tokenBalance,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('assets/images/token_btc.png'),
                            width: 50,
                            height: 50,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(33, 38, 48, 1)),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                UserItemAttributeRow(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  assetName:
                                      'assets/images/efficiency_icon.png',
                                  attributeName: S.of(context).efficiency,
                                  attributeVal: '0',
                                ),
                                UserItemAttributeRow(
                                  assetName:
                                      'assets/images/durability_icon.png',
                                  attributeName: S.of(context).durability,
                                  attributeVal: '0',
                                ),
                              ],
                            ),
                          ),
                        ),
                        StatisticButton(
                          width: 120,
                          height: 120,
                          children: [
                            const AttributeCircularPercentIndicator(
                              percent: 0.7,
                              progressColor: Color.fromRGBO(255, 128, 8, 1),
                            ),
                            Text(
                              S.of(context).ability,
                              style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              '55/10.000 km',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color.fromRGBO(33, 38, 48, 1)),
                              textAlign: TextAlign.center,
                            )
                          ],
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  UserItemAttributeRow(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    assetName: 'assets/images/luck_icon.png',
                                    attributeName: S.of(context).luck,
                                    attributeVal: '0',
                                  ),
                                  UserItemAttributeRow(
                                    assetName:
                                        'assets/images/distance_icon.png',
                                    attributeName: S.of(context).distance,
                                    attributeVal: '0',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          StatisticButton(
                            width: 120,
                            height: 120,
                            children: [
                              const AttributeCircularPercentIndicator(
                                  percent: 0.4,
                                  progressColor:
                                      Color.fromRGBO(6, 133, 3, 0.7)),
                              Text(
                                S.of(context).condition,
                                style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Text('0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Color.fromRGBO(33, 38, 48, 1)))
                            ],
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        S.of(context).myItems,
                        style: const TextStyle(
                            color: Color.fromRGBO(33, 38, 48, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, intindex) {
                          return const SingleOwnerItem();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
