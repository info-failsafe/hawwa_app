import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartView extends ConsumerWidget {
  final int id;
  const ChartView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text(
        '過去24時間のロググラフ',
        textAlign: TextAlign.center, // 中央揃え
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 300,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Stack(
                  children: [
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 8),
                              const FlSpot(2, 10),
                              const FlSpot(3, 14),
                            ],
                            isCurved: true,
                            color: const Color.fromRGBO(244, 67, 54, 1),
                            dotData: FlDotData(
                              show: true,
                              getDotPainter: (spot, percent, bar, index) =>
                                  FlDotCirclePainter(
                                radius: 4,
                                color: Colors.red,
                                strokeWidth: 2,
                                strokeColor: Colors.redAccent,
                              ),
                            ),
                            barWidth: 4,
                            belowBarData: BarAreaData(show: false),
                          ),
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 4),
                              const FlSpot(2, 5),
                              const FlSpot(3, 6),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 4,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                        titlesData: const FlTitlesData(show: true),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Stack(
                  children: [
                    BarChart(
                      BarChartData(
                        barGroups: [
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                  toY: 8, color: Colors.lightBlueAccent),
                              BarChartRodData(
                                  toY: 10, color: Colors.blueAccent),
                            ],
                          ),
                        ],
                      ),
                    ),
                    LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 12),
                              const FlSpot(2, 14),
                              const FlSpot(3, 10),
                            ],
                            isCurved: true,
                            color: Colors.red,
                            barWidth: 4,
                            belowBarData: BarAreaData(show: false),
                          ),
                          LineChartBarData(
                            spots: [
                              const FlSpot(1, 2),
                              const FlSpot(2, 3),
                              const FlSpot(3, 4),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 4,
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        OverflowBar(
          alignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity, // 幅を100%に設定
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  padding: const EdgeInsets.all(12),
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
      ],
    );
  }
}
