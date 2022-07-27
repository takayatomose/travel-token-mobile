import 'package:flutter/material.dart';

class UserItemContainer extends StatelessWidget {
  const UserItemContainer(
      {Key? key,
      this.appBarTitle,
      this.appBarLeading,
      this.bodyContainer,
      this.bottomNavigationBar})
      : super(key: key);
  final Widget? appBarTitle;
  final Widget? appBarLeading;
  final Widget? bodyContainer;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          leading: appBarLeading,
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: bodyContainer,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
