import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/constants.dart';
import 'package:hawwa_app/screen/navigation/tags.dart';
import 'package:hawwa_app/screen/navigation/monitors.dart';
import 'package:hawwa_app/screen/navigation/recipients.dart';

final indexProvider = StateProvider((ref) => 1);

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends ConsumerState<Navigation>
    with WidgetsBindingObserver {
  final _pageWidgets = [const Tags(), const Monitors(), const Recipients()];

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);

  //   // 復帰
  //   if (state == AppLifecycleState.resumed) {
  //     logger.d('復帰');
  //   }
  //   // // バックグラウンド
  //   // if (state == AppLifecycleState.paused) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidgets.elementAt(ref.watch(indexProvider)),
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
