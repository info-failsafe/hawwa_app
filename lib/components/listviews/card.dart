import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardListView extends ConsumerWidget {
  final int itemCount;
  final Padding item;
  // int index = 0;
  const CardListView({super.key, required this.itemCount, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, idx) {
          // this.index = idx;
          return Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            // padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
            child: item,
          );
        });
  }
}
