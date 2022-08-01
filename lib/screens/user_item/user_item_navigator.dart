import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/repositories/item_repository.dart';
import 'package:xtrip_mobile/screens/user_item/bloc/user_item_bloc.dart';
import 'package:xtrip_mobile/screens/user_item/user_item_main_screen.dart';
import 'package:xtrip_mobile/screens/user_item/user_item_points.dart';

class UserItemNavigator extends StatelessWidget {
  final int itemId;
  const UserItemNavigator({Key? key, required this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserItemBloc(
          itemId: itemId, itemRepository: context.read<ItemRepository>()),
      child: BlocBuilder<UserItemBloc, UserItemState>(
        builder: (context, state) {
          return Navigator(
            pages: [
              if (state.screenState == UserItemScreenStates.main)
                const MaterialPage(child: UserItemMainScreen()),
              if (state.screenState == UserItemScreenStates.points)
                const MaterialPage(child: UserItemPoints()),
            ],
            onPopPage: (route, result) => route.didPop(result),
          );
        },
      ),
    );
  }
}
