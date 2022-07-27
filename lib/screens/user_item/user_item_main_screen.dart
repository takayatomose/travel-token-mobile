import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/user_item/bloc/user_item_bloc.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_indicator.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_indicator_border.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_update_dialog.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_mints_progress.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_update_cost.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/user_item_container.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/user_item_image.dart';

class UserItemMainScreen extends StatelessWidget {
  const UserItemMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserItemBloc, UserItemState>(
      builder: (context, state) {
        return UserItemContainer(
          appBarLeading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          bodyContainer: SingleChildScrollView(
            child: Column(
              children: [
                const UserItemImage(),
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
                              onPressed: () {
                                context
                                    .read<UserItemBloc>()
                                    .add(EnterAddPointScreen());
                              },
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
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              if (index == 0) {
                showLevelUpPopup(context);
              }
              if (index == 1) {
                showRepairePopup(context);
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
        );
      },
    );
  }

  Future<dynamic> showRepairePopup(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ItemAttributeUpdateDialog(
          onConfirmPressed: () {},
          title: S.of(context).repair,
          widgets: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 10),
              child: Container(),
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
