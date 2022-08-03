import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/user_item/bloc/user_item_bloc.dart';

class UserItemImage extends StatelessWidget {
  const UserItemImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserItemBloc, UserItemState>(
      builder: (context, state) {
        return Container(
          // padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/item_background_2.png'))),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 30),
                      child: state.item?.image != null &&
                              state.item?.image != ''
                          ? Image.network(state.item!.image)
                          : Image.asset('assets/images/sneaker_example.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.item!.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            padding: const EdgeInsets.only(
                                top: 5, left: 30, right: 10, bottom: 5),
                            margin: const EdgeInsets.only(left: 15),
                            child: Text(
                              " LV ${state.item?.level}",
                              style: const TextStyle(
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
        );
      },
    );
  }
}
