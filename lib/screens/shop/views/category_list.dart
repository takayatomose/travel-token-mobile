import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<Color> backgroundColor = <Color>[
    Color.fromRGBO(180, 243, 244, 1),
    Color.fromRGBO(201, 244, 180, 1),
    Color.fromRGBO(244, 226, 180, 1),
    Color.fromRGBO(244, 180, 180, 1),
    Color.fromRGBO(224, 180, 244, 1)
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return Container(
          height: 120,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, top: 16),
              itemCount: state.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryItem(
                    backgroundColor: backgroundColor[index % 5],
                    index: index,
                    name: state.categories[index].name.toUpperCase());
              }),
        );
      },
    );
  }
}
