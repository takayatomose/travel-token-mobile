import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_indicator.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_indicator_border.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_update_dialog.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_mints_progress.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_update_cost.dart';

class UserItemNavigator extends StatelessWidget {
  const UserItemNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/item_background_2.png'))),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 30),
                              child: Image.asset(
                                  'assets/images/sneaker_example.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    '#SNEK24298',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                            width: 1, color: Colors.white)),
                                    padding: const EdgeInsets.only(
                                        top: 5, left: 30, right: 10, bottom: 5),
                                    margin: const EdgeInsets.only(left: 15),
                                    child: const Text(
                                      'LV 3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    'assets/icons/ic_item_efficiency_gradient.png')),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    'assets/icons/ic_item_luck_gradient.png'))
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/ic_item_recovery_gradient.png')),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      'assets/icons/ic_item_distance_gradient.png'))
                            ],
                          ))
                    ],
                  ),
                ),
                const ItemMintsProgress(
                  maxNumOfMints: 5,
                  numOfMints: 2,
                ),
                ItemAttributeIndicatorBorder(
                    centerText: S.of(context).conditionProgress('70.4/100'),
                    percent: 0.75),
                ItemAttributeIndicatorBorder(
                    centerText: S.of(context).lifetimeProgress('60/120'),
                    percent: 0.5),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    S.of(context).howToPlay,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Text(
                          S.of(context).attributes.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                primary: const Color.fromRGBO(255, 128, 8, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(48)),
                              ),
                              onPressed: () {},
                              child: Text(
                                S.of(context).base,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(42, 46, 71, 1)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(48))),
                              onPressed: () {},
                              child: Text(
                                S.of(context).availablePoint(0),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(42, 46, 71, 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ItemAttributeIndicator(
                  attributeName: S.of(context).efficiency,
                  assetName: 'assets/icons/ic_item_efficiency.png',
                  attributeValue: '10',
                  percent: 0.5,
                ),
                ItemAttributeIndicator(
                  attributeName: S.of(context).recovery,
                  assetName: 'assets/icons/ic_item_recovery.png',
                  attributeValue: '3',
                  percent: 0.7,
                ),
                ItemAttributeIndicator(
                  attributeName: S.of(context).luck,
                  assetName: 'assets/icons/ic_item_luck.png',
                  attributeValue: '6',
                  percent: 0.6,
                ),
                ItemAttributeIndicator(
                  attributeName: S.of(context).distance,
                  assetName: 'assets/icons/ic_item_distance.png',
                  attributeValue: '5',
                  percent: 0.4,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            if (index == 0) {
              showLevelUpPopup(context);
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_item_level_up.png',
                  width: 30,
                  height: 30,
                ),
                label: S.of(context).levelUp),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_item_repair.png',
                  width: 30,
                  height: 30,
                ),
                label: S.of(context).repair),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_item_mint.png',
                  width: 30,
                  height: 30,
                ),
                label: S.of(context).mint),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_item_sell.png',
                  width: 30,
                  height: 30,
                ),
                label: S.of(context).sell),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_item_lease.png',
                  width: 30,
                  height: 30,
                ),
                label: S.of(context).lease),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/ic_item_transfer.png',
                  width: 30,
                  height: 30,
                ),
                label: S.of(context).transfer),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showLevelUpPopup(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ItemAttributeUpdateDialog(
          title: S.of(context).levelUp,
          widgets: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Text(
                S.of(context).levelUpTo('4'),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ItemUpdateCost(
                  costName: S.of(context).time, costVal: '240 mins'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: ItemUpdateCost(
                  costName: S.of(context).cost, costVal: '1.4 XTR'),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                S.of(context).tokenAvailable('10.48 XTR'),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        );
      },
    );
  }
}
