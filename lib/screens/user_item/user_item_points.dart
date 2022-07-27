import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/user_item/bloc/user_item_bloc.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/user_item_widgets.dart';

class UserItemPoints extends StatefulWidget {
  const UserItemPoints({Key? key}) : super(key: key);

  @override
  State<UserItemPoints> createState() => _UserItemPointsState();
}

class _UserItemPointsState extends State<UserItemPoints> {
  int availablePoints = 5;
  int efficicencyPoints = 5;
  int distancePoints = 5;
  int luckPoints = 6;
  int recoveryPoints = 10;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserItemBloc, UserItemState>(
      builder: (context, state) {
        return UserItemContainer(
          appBarTitle: Text(S.of(context).addPoints),
          appBarLeading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<UserItemBloc>().add(EnterUserItemMainScreen());
            },
          ),
          bodyContainer: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const UserItemImage(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(S
                          .of(context)
                          .availablePoints(availablePoints.toString())),
                    ),
                    _itemAttributeEfficiency(context),
                    _itemAttributeRecovery(context),
                    _itemAttributeLuck(context),
                    _itemRecoveryDistance(context),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: UserItemBtnActions(
                  onCancelPressed: () {
                    context.read<UserItemBloc>().add(EnterUserItemMainScreen());
                  },
                  onConfirmPressed: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding _itemRecoveryDistance(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ItemAttributePointIndicator(
        onAddPressed: () {
          if (availablePoints == 0) {
            return;
          }
          setState(() {
            distancePoints += 1;
            availablePoints -= 1;
          });
        },
        attributeVal: distancePoints.toString(),
        assetName: 'assets/icons/ic_item_distance.png',
        attributeName: S.of(context).distance,
        onSubPressed: () {
          if (distancePoints == 5) {
            return;
          }
          setState(() {
            distancePoints -= 1;
            availablePoints += 1;
          });
        },
      ),
    );
  }

  Padding _itemAttributeLuck(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ItemAttributePointIndicator(
        onAddPressed: () {
          if (availablePoints == 0) {
            return;
          }
          setState(() {
            luckPoints += 1;
            availablePoints -= 1;
          });
        },
        attributeVal: luckPoints.toString(),
        assetName: 'assets/icons/ic_item_luck.png',
        attributeName: S.of(context).efficiency,
        onSubPressed: () {
          if (luckPoints == 6) {
            return;
          }
          setState(() {
            luckPoints -= 1;
            availablePoints += 1;
          });
        },
      ),
    );
  }

  Padding _itemAttributeRecovery(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ItemAttributePointIndicator(
        onAddPressed: () {
          if (availablePoints == 0) {
            return;
          }
          setState(() {
            recoveryPoints += 1;
            availablePoints -= 1;
          });
        },
        attributeVal: recoveryPoints.toString(),
        assetName: 'assets/icons/ic_item_recovery.png',
        attributeName: S.of(context).recovery,
        onSubPressed: () {
          if (recoveryPoints == 10) {
            return;
          }
          setState(() {
            recoveryPoints -= 1;
            availablePoints += 1;
          });
        },
      ),
    );
  }

  Padding _itemAttributeEfficiency(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ItemAttributePointIndicator(
        onAddPressed: () {
          if (availablePoints == 0) {
            return;
          }
          setState(() {
            efficicencyPoints += 1;
            availablePoints -= 1;
          });
        },
        attributeVal: efficicencyPoints.toString(),
        assetName: 'assets/icons/ic_item_efficiency.png',
        attributeName: S.of(context).efficiency,
        onSubPressed: () {
          if (efficicencyPoints == 5) {
            return;
          }
          setState(() {
            efficicencyPoints -= 1;
            availablePoints += 1;
          });
        },
      ),
    );
  }
}
