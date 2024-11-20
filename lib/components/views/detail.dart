import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/components/containers/card.dart';
import 'package:fl_chart/fl_chart.dart';

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
                CardContainer(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.only(
                                top: 2.0, bottom: 2.0, left: 8.0, right: 8.0),
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
                Expanded(
                    child: BarChart(
                  BarChartData(
                    barGroups: [
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            y: 0,
                            colors: [Colors.blue],
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            y: 10,
                            colors: [Colors.blue],
                          )
                        ],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(
                            y: 14,
                            colors: [Colors.blue],
                          )
                        ],
                      ),
                    ],
                    titlesData: FlTitlesData(show: true),
                    borderData: FlBorderData(show: false),
                    alignment: BarChartAlignment.spaceAround,
                    gridData: FlGridData(show: false),
                  ),
                )),
                SizedBox(height: 16),
                Expanded(
                    child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(1, 8),
                          FlSpot(2, 10),
                          FlSpot(3, 14),
                        ],
                        isCurved: true,
                        colors: [Colors.red],
                        barWidth: 4,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      )
                    ],
                    titlesData: FlTitlesData(show: true),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                  ),
                )),
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
