import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // 影の色と透明度,
            spreadRadius: 1, // 影の広がり
            blurRadius: 8, // ぼかしの半径
            offset: const Offset(0, 0), // 影の位置: 横方向のオフセット, 縦方向のオフセット
          ),
        ],
      ),
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
      child: child,
    );
  }
}
