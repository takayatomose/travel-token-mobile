import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      required this.backgroundColor,
      required this.index,
      required this.name,
      required this.icon})
      : super(key: key);
  final Color backgroundColor;
  final int index;
  final String name;
  final String icon;

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
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    primary: backgroundColor, // <-- Button color
                  ),
                  child: Image.network(icon,
                      width: 32, height: 32, fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Center(
                      child: Text(
                    name.toUpperCase(),
                    style: TextStyle(
                        fontSize: 14,
                        color: state.selectedCategoryIndex == index
                            ? const Color.fromRGBO(255, 128, 8, 1)
                            : Colors.black),
                  )),
                ),
              ],
            );
          },
        ));
  }
}
