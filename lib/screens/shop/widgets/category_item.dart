import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.backgroundColor, required this.index, required this.name})
      : super(key: key);
  final Color backgroundColor;
  final int index;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 40),
        child: BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                ElevatedButton(
                  // style: style,
                  onPressed: () {
                    context.read<ShopBloc>().add(SelectCategory(index));
                  },
                  child: Icon(
                    Icons.volume_up,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    primary: backgroundColor, // <-- Button color
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Center(
                      child: Text(
                    '${state.categories[index].name.toUpperCase()}',
                    style: TextStyle(
                        fontSize: 14,
                        color: state.selectedCategoryIndex == index
                            ? Color.fromRGBO(255, 128, 8, 1)
                            : Colors.black),
                  )),
                ),
              ],
            );
          },
        ));
  }
}
