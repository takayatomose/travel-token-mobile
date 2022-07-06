import 'package:flutter/material.dart';

class SingleOwnerItem extends StatelessWidget {
  const SingleOwnerItem({Key? key}) : super(key: key);

  @override
  Widget build(Object context) {
    return Container(
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
        children: const [
          Text(
            'Running Shoes TAS #1',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '#SNEK24298',
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Image(image: AssetImage('assets/images/sneaker_example.png')),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Condition',
              style: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          ),
          Text(
            '90%',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(255, 255, 255, 1)),
          ),
        ],
      ),
    );
  }
}
