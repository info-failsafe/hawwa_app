import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/components/appbars/navigation.dart';

import 'package:hawwa_app/constants.dart';
import 'package:hawwa_app/providers.dart';
import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/freezed/monitor.dart';
import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/components/views/paging.dart';
import 'package:hawwa_app/components/views/refine.dart';
// import 'package:hawwa_app/components/appbars/navigation.dart';
// import 'package:hawwa_app/components/buttons/remove.dart';
import 'package:hawwa_app/components/buttons/edit.dart';
// import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/components/containers/card.dart';
import 'package:hawwa_app/screen/navigation/tags.dart';

final tagListProvider = StateProvider<Map<int, String>>((ref) => {});
final monitorListProvider =
    StateNotifierProvider<MonitorListNotifier, List<Monitor>>(
        (ref) => MonitorListNotifier());

class MonitorListNotifier extends StateNotifier<List<Monitor>> {
  MonitorListNotifier() : super([]);

  void add(Monitor monitor) {
    state = [...state, monitor];
  }

  void change(index, column, value) {
    switch (column) {
      case 'checked':
        bool checked = false;
        if (value == true) checked = true;
        state = [
          for (int i = 0; i < state.length; i++)
            if (i == index) state[i].copyWith(checked: checked) else state[i]
        ];
        break;
    }
  }
}

class Monitors extends ConsumerWidget with WidgetsBindingObserver {
  const Monitors({super.key});

  // タグ取得
  void _getTagList(WidgetRef ref) {
    final tagList = ref.watch(tagListProvider);
    final monitorList = ref.watch(monitorListProvider);
    List<int> list = [];
    var result = false;
    for (int i = 0; i < monitorList.length; i++) {
      for (int n = 0; n < monitorList[i].tags.length; n++) {
        list = [...list, monitorList[i].tags[n]];
      }
    }
    for (int i = 0; i < list.length; i++) {
      if (!tagList.containsKey(list[i])) result = true;
    }
    // タグリスト取得
    if (result) {
      Constants.logger.d('タグリストデータ取得');
      ref.read(tagListProvider.notifier).state[2] = '２番めテスト';
      ref.read(tagListProvider.notifier).state[5] = '５番目テスト';
      ref.read(tagListProvider.notifier).state[9] = '９番目テスト';
    }
  }

  // タグ表示
  Row _rowTagList(WidgetRef ref, List<int> tags) {
    final tagList = ref.watch(tagListProvider);
    List<Widget> _tags = [];
    for (int i = 0; i < tags.length; i++) {
      if (!tagList.containsKey(tags[i])) continue;
      _tags = [
        ..._tags,
        Container(
          padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Text(
            key: key,
            tagList[tags[i]].toString(),
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ),
      ];
      if ((tags.length - 1) != i) _tags = [..._tags, SizedBox(width: 8.0)];
    }

    return Row(children: _tags);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MonitorListNotifier monitorListNotifier =
        ref.read(monitorListProvider.notifier);
    _getTagList(ref);

    return Scaffold(
      appBar: NavigationAppBar(
        text: '死活監視',
        onPressed: () {
          monitorListNotifier.add(
            const Monitor(
              id: 1,
              org_id: 1,
              flag: 2,
              url: 'https://hawwa.failsafe.jp',
              tags: [2, 5, 9],
              remarks: '備考テキスト',
              checked: false,
            ),
          );
          // logger.d(ref.watch(MonitorListProvider));
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width, height: 16),
            FilterTextField(onChanged: (text) {}),
            const SizedBox(height: 8),
            const RefineButton(), // 条件で絞り込んで表示
            const PagingArea(), // 全て選択

            Expanded(
              child: ListView.builder(
                itemCount: ref.watch(monitorListProvider).length,
                itemBuilder: (ctx, idx) => CardContainer(
                    child: Column(children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // これで両端に寄せる
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 2.0,
                            child: Checkbox(
                              value:
                                  ref.watch(monitorListProvider)[idx].checked,
                              activeColor: Colors.blue,
                              side: const BorderSide(width: 0.5),
                              onChanged: (bool? value) => monitorListNotifier
                                  .change(idx, 'checked', value),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                key: key,
                                ref.watch(monitorListProvider)[idx].url,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ), // URL
                              if (ref
                                  .watch(monitorListProvider)[idx]
                                  .remarks
                                  .isNotEmpty)
                                Text(
                                  key: key,
                                  ref.watch(monitorListProvider)[idx].remarks,
                                  style: const TextStyle(color: Colors.grey), //
                                ), //備考
                            ],
                          ),
                        ],
                      ),
                      EditButton(
                        id: 1,
                        // 編集タップ時のダイアログ
                        column: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
                            CustomTextField(
                              labelText: 'タグ名',
                              hintText: '#タグ',
                              obscureText: false,
                              onChanged: (text) {},
                            ),
                            const SizedBox(height: 24.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12.0),
                        _rowTagList(
                            ref, ref.watch(monitorListProvider)[idx].tags),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            const Text(
                              'コード',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 6, bottom: 6, left: 8, right: 8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorLight,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      key: key,
                                      '200  正常',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18.0),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 2, bottom: 2, left: 8, right: 8),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: const Row(
                                        children: [
                                          Text('エラー  '),
                                          Text(
                                            '3',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('回 / 週'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        const Row(
                          children: [
                            Text(
                              '証明書',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'US - Lets Encript R3',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '2024.01.01 - 2024.12.31  / ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      '残り',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    Text(
                                      '30',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '日',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
