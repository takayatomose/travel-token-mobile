import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/shop/shop.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ShopBloc shopBloc = ShopBloc(httpClient: http.Client());

  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "&orderBy=price&sort=ASC", child: Text("Lowest Price")),
    const DropdownMenuItem(
        value: "&orderBy=price&sort=DESC", child: Text("Highest Price")),
  ];

  @override
  void initState() {
    shopBloc.add(FetchCategories());
    shopBloc.add(FetchItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => shopBloc,
      child: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 42, left: 21),
                child: Column(children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'XTRIP SHOP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Have a nice shopping',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left),
                  )
                ]),
              ),
              const CategoryList(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 20, left: 21),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        color:
                            Colors.white, //background color of dropdown button
                        border: Border.all(
                            color: Colors.black38,
                            width: 1), //border of dropdown button
                        borderRadius: BorderRadius.circular(
                            50), //border raiuds of dropdown button
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: DropdownButton(
                            value: state.sortText,
                            items: menuItems,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            style: const TextStyle(
                              color: Colors.black, //Font color
                            ),
                            underline: Container(), //remove underline
                            onChanged: (String? newValue) {
                              final value = newValue ?? '';
                              context
                                  .read<ShopBloc>()
                                  .add(SelectSortText(value));
                            },
                            hint: const Text("Sort"),
                          ))),
                ),
              ),
              Expanded(
                child: ItemList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
