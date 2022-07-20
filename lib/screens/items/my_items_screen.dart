import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/items/bloc/my_item_bloc.dart';
import 'package:xtrip_mobile/screens/items/widgets/user_attributes_widget.dart';
import 'package:xtrip_mobile/sessions/list_submission_status.dart';
import 'package:xtrip_mobile/widgets/user_items/user_items.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({Key? key}) : super(key: key);

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyItemBloc()..add(FetchItems()),
      child: BlocConsumer<MyItemBloc, MyItemState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const UserItemAttributesWidget(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        S
                            .of(context)
                            .myItems(state.numOfItems.toString())
                            .toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(33, 38, 48, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                    if (state.numOfItems == 0 &&
                        state.listSubmissionStatus is! FetchingDataListStatus)
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Image(
                                width: 150,
                                height: 150,
                                image: AssetImage('assets/images/no_items.png'),
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15),
                                    primary:
                                        const Color.fromRGBO(255, 128, 8, 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {},
                                child: Text(S.of(context).goToShop))
                          ],
                        ),
                      ),
                    if (state.numOfItems != 0)
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.numOfItems,
                          itemBuilder: (BuildContext context, int index) {
                            return SingleOwnerItem(
                                userItem: state.items[index]);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
