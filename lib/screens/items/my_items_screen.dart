import 'package:flutter/material.dart';
import 'package:xtrip_mobile/widgets/map_bottom_sheet/map_bottom_sheet.dart';
import 'package:xtrip_mobile/widgets/user_items/user_items.dart';

class MyItemsScreen extends StatelessWidget {
  const MyItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "Token balance",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
                        children: const [
                          UserItemAttributeRow(
                            margin: EdgeInsets.only(bottom: 20),
                            assetName: 'assets/images/efficiency_icon.png',
                            attributeName: 'Efficiency',
                            attributeVal: '0',
                          ),
                          UserItemAttributeRow(
                            assetName: 'assets/images/durability_icon.png',
                            attributeName: 'Durability',
                            attributeVal: '0',
                          ),
                        ],
                      ),
                    ),
                  ),
                  StatisticButton(
                    width: 120,
                    height: 120,
                    children: const [
                      AttributeCircularPercentIndicator(
                        percent: 0.7,
                        progressColor: Color.fromRGBO(255, 128, 8, 1),
                      ),
                      Text(
                        'Ability',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            UserItemAttributeRow(
                              margin: EdgeInsets.only(bottom: 15),
                              assetName: 'assets/images/luck_icon.png',
                              attributeName: 'Luck',
                              attributeVal: '0',
                            ),
                            UserItemAttributeRow(
                              assetName: 'assets/images/distance_icon.png',
                              attributeName: 'Distance',
                              attributeVal: '0',
                            ),
                          ],
                        ),
                      ),
                    ),
                    StatisticButton(
                      width: 120,
                      height: 120,
                      children: const [
                        AttributeCircularPercentIndicator(
                            percent: 0.4,
                            progressColor: Color.fromRGBO(6, 133, 3, 0.7)),
                        Text(
                          'Condition',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text('0',
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
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'My Items',
                  style: TextStyle(
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
  }
}
