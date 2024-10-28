import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/screen/navigation/tags.dart';
import 'package:hawwa_app/screen/navigation/monitors.dart';
import 'package:hawwa_app/screen/navigation/recipients.dart';

final indexProvider = StateProvider((ref) => 1);
final pageWidgets = [const Tags(), const Monitors(), const Recipients()];

class Navigation extends ConsumerWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: pageWidgets.elementAt(ref.watch(indexProvider)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
