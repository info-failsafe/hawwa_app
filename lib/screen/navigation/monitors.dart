import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/freezed/monitor.dart';

final MonitorListProvider =
    StateNotifierProvider<MonitorListNotifier, List<Monitor>>(
        (ref) => MonitorListNotifier());

class MonitorListNotifier extends StateNotifier<List<Monitor>> {
  MonitorListNotifier() : super([]);

  void add(Monitor monitor) {
    state = [...state, monitor];
  }

  void change(id, column) {}
}

class Monitors extends ConsumerWidget {
  const Monitors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TagListNotifier tagListNotifier = ref.read(tagListProvider.notifier);
    MonitorListNotifier monitorListNotifier =
        ref.read(MonitorListProvider.notifier);

    return Scaffold(
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(width: MediaQuery.of(context).size.width),
        CustomTextField(
          labelText: 'E-mail',
          hintText: 'メールアドレス',
          obscureText: false,
          onChanged: (text) {},
        )
      ])),
    );
  }
}
