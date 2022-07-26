import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/items/bloc/my_item_bloc.dart';
import 'package:xtrip_mobile/sessions/game_screen_cubit.dart';
import 'package:xtrip_mobile/widgets/paints/trapezoid_paint.dart';

import '../../models/user_item.dart';

class SingleOwnerItem extends StatelessWidget {
  const SingleOwnerItem({Key? key, required this.userItem}) : super(key: key);
  final UserItem userItem;

  @override
  Widget build(BuildContext context) {
    final MyItemBloc myItemBloc = Provider.of<MyItemBloc>(context);
    final GameScreenCubit gameScreenCubit =
        Provider.of<GameScreenCubit>(context);

    return InkWell(
      onTap: () {
        gameScreenCubit.enterUserItemScreen(itemId: userItem.id);
        // showDialog(
        //     context: context,
        //     builder: (context) => Dialog(
        //           child: SizedBox(
        //             width: double.infinity,
        //             child: Column(
        //               mainAxisSize: MainAxisSize.min,
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 20),
        //                   child: Text(
        //                     userItem.name,
        //                     style: const TextStyle(color: Colors.black),
        //                   ),
        //                 ),
        //                 const Image(
        //                   image:
        //                       AssetImage('assets/images/sneaker_example.png'),
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     if (userItem.equippedState ==
        //                         UserItemStates.unEquipped)
        //                       ElevatedButton(
        //                           onPressed: () {
        //                             myItemBloc
        //                                 .add(EquippedItem(itemId: userItem.id));
        //                           },
        //                           child: const Text('Equipe')),
        //                     if (userItem.equippedState !=
        //                         UserItemStates.mainEquipped)
        //                       ElevatedButton(
        //                           onPressed: () {
        //                             myItemBloc.add(SetMainEquippedItem(
        //                                 itemId: userItem.id));
        //                           },
        //                           child: const Text('Main Equiped')),
        //                     if (userItem.equippedState !=
        //                         UserItemStates.unEquipped)
        //                       ElevatedButton(
        //                           onPressed: () {
        //                             myItemBloc.add(
        //                                 UnEquippedItem(itemId: userItem.id));
        //                           },
        //                           child: const Text('Un Equipped'))
        //                   ],
        //                 )
        //               ],
        //             ),
        //           ),
        //         ))
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/item_background.png')),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userItem.name,
                  style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    userItem.code,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Image(
                    image: AssetImage('assets/images/sneaker_example.png')),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    S.of(context).condition,
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
                const Text(
                  '90%',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 100,
                height: 30,
                child: CustomPaint(
                  painter: TrapezoidPainter(
                      color: const Color.fromRGBO(255, 128, 8, 1)),
                  size: const Size(100, 30),
                  child: Center(
                      child: Text(
                    'Level ${userItem.level}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
