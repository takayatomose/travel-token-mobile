import 'package:flutter/material.dart';
import 'package:xtrip_mobile/widgets/map_bottom_sheet/map_bottom_sheet.dart';

class MyItemsScreen extends StatelessWidget {
  const MyItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Token balance"),
            Row(
              children: const [
                Image(image: AssetImage('assets/images/token_btc.png')),
                Text('0')
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 1),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Image(
                              image: AssetImage(
                                  'assets/images/efficiency_icon.png')),
                          Text('Efficiency'),
                          Text('0')
                        ],
                      ),
                    )
                  ],
                ),
                AbilityButton(
                  text: 'Ability',
                  detailText: '0 km',
                  backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
                  progressColor: const Color.fromRGBO(255, 128, 8, 1),
                  percent: 0.4,
                  onPressed: () {},
                )
              ],
            ),
            Row(
              children: [
                Column(),
                AbilityButton(
                  text: 'Condition',
                  detailText: '0',
                  backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
                  progressColor: const Color.fromRGBO(23, 173, 20, 1),
                  percent: 0.6,
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
