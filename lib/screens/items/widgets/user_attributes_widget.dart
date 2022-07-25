import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/sessions/game_screen_cubit.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';
import 'package:xtrip_mobile/widgets/map_bottom_sheet/map_bottom_sheet.dart';
import 'package:xtrip_mobile/widgets/user_items/user_items.dart';

class UserItemAttributesWidget extends StatefulWidget {
  const UserItemAttributesWidget({Key? key}) : super(key: key);

  @override
  State<UserItemAttributesWidget> createState() =>
      _UserItemAttributesWidgetState();
}

class _UserItemAttributesWidgetState extends State<UserItemAttributesWidget> {
  late SessionCubit sessionCubit;
  late GameScreenCubit gameScreenCubit;
  @override
  void initState() {
    super.initState();
    sessionCubit = BlocProvider.of<SessionCubit>(context);
    sessionCubit.fetchUserAttributes();
    gameScreenCubit = BlocProvider.of<GameScreenCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionCubit, SessionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                gameScreenCubit.enterWalletScreen();
                // sessionCubit.enterWalletScreen();
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(26)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Image(
                      image: AssetImage(
                        'assets/icons/ic_xtr.png',
                      ),
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 20),
                      child: Text(
                        '0',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(33, 38, 48, 1)),
                      ),
                    ),
                    Image(
                      image: AssetImage(
                        'assets/icons/ic_gxt.png',
                      ),
                      width: 20,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '0',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(33, 38, 48, 1)),
                      ),
                    ),
                  ],
                ),
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
                          assetName: 'assets/images/efficiency_icon.png',
                          attributeName: S.of(context).efficiency,
                          attributeVal:
                              state.userPlayAttributes.efficiency.toString(),
                        ),
                        UserItemAttributeRow(
                          assetName: 'assets/images/durability_icon.png',
                          attributeName: S.of(context).durability,
                          attributeVal:
                              state.userPlayAttributes.lifetime.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                StatisticButton(
                  width: 140,
                  height: 140,
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
                    Text(
                      "55/${state.userPlayAttributes.distance} km",
                      style: const TextStyle(
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
                        children: [
                          UserItemAttributeRow(
                            margin: const EdgeInsets.only(bottom: 15),
                            assetName: 'assets/images/luck_icon.png',
                            attributeName: S.of(context).luck,
                            attributeVal:
                                state.userPlayAttributes.luck.toString(),
                          ),
                          UserItemAttributeRow(
                            assetName: 'assets/images/distance_icon.png',
                            attributeName: S.of(context).distance,
                            attributeVal:
                                state.userPlayAttributes.distance.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  StatisticButton(
                    width: 140,
                    height: 140,
                    children: [
                      const AttributeCircularPercentIndicator(
                          percent: 0.4,
                          progressColor: Color.fromRGBO(6, 133, 3, 0.7)),
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
          ],
        );
      },
    );
  }
}
