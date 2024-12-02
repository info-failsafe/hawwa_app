import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/components/containers/card.dart';
import 'package:hawwa_app/freezed/log.dart';
import 'package:hawwa_app/components/views/chart.dart';

final logListProvider = StateNotifierProvider<LogListNotifier, List<Log>>(
    (ref) => LogListNotifier());

class LogListNotifier extends StateNotifier<List<Log>> {
  LogListNotifier() : super([]);

  void add(Log tag) {
    state = [...state, tag];
  }
}

class DetailView extends ConsumerWidget {
  final int id;
  // final Column column;
  const DetailView({
    super.key,
    required this.id,
    // required this.column,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // LogListNotifier logListNotifier = ref.read(logListProvider.notifier);
    // logListNotifier logListNotifier = ref.read(logListProvider.notifier);

    // TagListNotifier tagListNotifier = ref.read(tagListProvider.notifier);
    LogListNotifier logListNotifier = ref.read(logListProvider.notifier);

    return Dialog.fullscreen(
      child: Column(
        children: [
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.min, //上下中央揃え
              children: [
                const SizedBox(height: 32),
                const Text(
                  'https://hawwa.failsafe.jp/ の過去ログ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsetsDirectional.all(8.0),
                  color: Theme.of(context).primaryColorLight,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          logListNotifier.add(
                            Log(
                              id: 2,
                              text: {
                                'code': '正常',
                                'created': '2024.11.27 - 10:59',
                                'modified': '2024.11.27 - 10:59',
                              },
                              code: 200,
                              data: {
                                'total_time': 0.343378,
                                'header_size': 157,
                                'connect_time': 0.032231,
                                'request_size': 53,
                                'namelookup_time': 0.030249,
                                'pretransfer_time': 0.339464,
                                'ssl_verify_request': 0,
                                'starttransfer_time': 0.343346,
                              },
                              created:
                                  DateTime.parse("2024-11-27T10:59:06+09:00"),
                              modified:
                                  DateTime.parse("2024-11-27T10:59:06+09:00"),
                            ),
                          );
                          // logger.d(ref.watch(MonitorListProvider));
                        },
                      ),
                      const Spacer(), // 左側のスペースを埋めるためのウィジェット
                      TextButton.icon(
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(Colors.blue),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => const ChartView(
                              id: 2,
                            ),
                          );
                        },
                        label: const Text('過去24時間のロググラフを表示'),
                        icon: const Icon(Icons.bar_chart_sharp),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ref.watch(logListProvider).length,
                    itemBuilder: (ctx, idx) => CardContainer(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                color: Theme.of(context).primaryColor,
                                padding: const EdgeInsets.only(
                                    top: 2.0,
                                    bottom: 2.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: const Text(
                                  'NEW',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              const Text(
                                '2024.11.18 - 12:34',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          const Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('コード',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '000',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('エラー内容',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '未到達',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('ヘッダー',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('リクエスト',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '53',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('伝送秒',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '30.001167',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('接続確立秒',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '0.031003',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('名前解決秒',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '30.001167',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('開始伝送秒',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '0.031003',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('バイト伝送秒',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        strutStyle: StrutStyle(
                                          fontSize: 20.0,
                                          height: 1.5,
                                        )),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        // color: Colors.red,
                                      ),
                                      strutStyle: StrutStyle(
                                        fontSize: 20.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        // 角を丸める
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      '閉じる',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
