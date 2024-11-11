import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 0.0, right: 0.0),
      child: child,
    );
  }
}
