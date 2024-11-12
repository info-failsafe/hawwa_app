import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/components/appbars/navigation.dart';

import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/freezed/monitor.dart';
import 'package:hawwa_app/freezed/tag.dart';
import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/components/views/paging.dart';
import 'package:hawwa_app/components/views/refine.dart';
import 'package:hawwa_app/components/appbars/navigation.dart';
import 'package:hawwa_app/components/buttons/remove.dart';
import 'package:hawwa_app/components/buttons/edit.dart';
import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/components/containers/card.dart';
import 'package:hawwa_app/main.dart';

// monitor
final MonitorListProvider =
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

class Monitors extends ConsumerWidget {
  const Monitors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TagListNotifier tagListNotifier = ref.read(tagListProvider.notifier);
    MonitorListNotifier monitorListNotifier =
        ref.read(MonitorListProvider.notifier);

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
              tags: [1, 2, 3],
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
                itemCount: ref.watch(MonitorListProvider).length,
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
                                  ref.watch(MonitorListProvider)[idx].checked,
                              activeColor: Colors.blue,
                              side: const BorderSide(width: 0.5),
                              onChanged: (bool? value) => monitorListNotifier
                                  .change(idx, 'checked', value),
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                key: key,
                                ref.watch(MonitorListProvider)[idx].url,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ), // URL
                              if (ref
                                  .watch(MonitorListProvider)[idx]
                                  .remarks
                                  .isNotEmpty)
                                Text(
                                  key: key,
                                  ref.watch(MonitorListProvider)[idx].remarks,
                                  style: const TextStyle(color: Colors.grey), //
                                ), //備考
                            ],
                          ),
                        ],
                      ),
                      // TextButton(
                      //   style: ButtonStyle(
                      //       foregroundColor:
                      //           WidgetStateProperty.all(Colors.blue)),
                      //   onPressed: () => () {},
                      //   child: const Text('編集'),
                      // ),
                      PopupMenuButton<String>(
                          onSelected: (String value) {
                            print('object');
                          },
                          child: const Text(
                            '編集',
                            style: TextStyle(color: Colors.blue),
                          ),
                          // icon: Icon(Icons.more_vert), // メニューアイコンの設定
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: 'item',
                                child: Text('アイテム1'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'item',
                                child: Text('アイテム2'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'item',
                                child: Text('アイテム3'),
                              ),
                            ];
                          }),
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 2, left: 8, right: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                key: key,
                                'タグ１',
                                style: const TextStyle(color: Colors.blueGrey),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 2, bottom: 2, left: 8, right: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                key: key,
                                'タグ２',
                                style: const TextStyle(color: Colors.blueGrey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            const Text(
                              'コード',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 16.0),
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
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: const Row(
                                        children: [
                                          Text('エラー  '),
                                          Text(
                                            '3',
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(' 回 / 週'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        const Row(
                          children: [
                            const Text(
                              '証明書',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'US - Lets Encript R3',
                                  style: const TextStyle(color: Colors.grey),
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
