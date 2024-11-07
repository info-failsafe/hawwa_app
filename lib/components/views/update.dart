import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/components/buttons/gradient.dart';

import 'package:hawwa_app/components/textfields/custom.dart';

class UpdateView extends ConsumerWidget {
  final int id;
  final Column column;
  const UpdateView({super.key, required this.id, required this.column});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog.fullscreen(
      child: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              column,
              CustomTextField(
                labelText: '備考',
                hintText: '説明文などを入力',
                obscureText: false,
                onChanged: (text) {},
              ),
            ],
          )),
          Padding(
            padding: EdgeInsets.all(0.0),
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
                      padding: EdgeInsets.all(16.0),
                    ),
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      'キャンセル',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        // 角を丸める
                        borderRadius: BorderRadius.circular(0),
                      ),
                      padding: EdgeInsets.all(16.0),
                    ),
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      '更新する',
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