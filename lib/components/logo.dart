import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          'HAWWA',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            letterSpacing: 8,
          ),
        ),
        Text(
          '死活監視',
          style: TextStyle(
            fontSize: 12,
            // fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            letterSpacing: 8,
          ),
        ),
      ]),
    );
  }
}
