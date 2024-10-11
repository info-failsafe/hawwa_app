import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/view/navigation/tags.dart';
import 'package:hawwa_app/view/navigation/monitors.dart';
import 'package:hawwa_app/view/navigation/recipients.dart';

final indexProvider = StateProvider((ref) => 1);
final pageWidgets = [Tags(), Monitors(), Recipients()];

class Navigation extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: pageWidgets.elementAt(ref.watch(indexProvider)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.tag),
            label: 'タグ編集',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: '死活監視',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_received),
            label: '受信設定',
          ),
        ],
        currentIndex: ref.watch(indexProvider),
        fixedColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).indicatorColor,
        onTap: (index) => ref.read(indexProvider.notifier).state = index,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
