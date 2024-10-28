import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/components/textfields/custom.dart';

class UpdateView extends ConsumerWidget {
  final int id;
  final Column column;
  const UpdateView({super.key, required this.id, required this.column});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog.fullscreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: TextButton(
              style: ButtonStyle(
                // 幅,高
                backgroundColor: WidgetStateProperty.all(Colors.grey),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // 角の丸みを指定
                  ),
                ),
              ),
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                'キャンセル',
                style: TextStyle(fontSize: 18),
              ),
            )),
            // const SizedBox(width: 16.0),
            Expanded(
                child: TextButton(
              style: ButtonStyle(
                // 幅,高
                backgroundColor: WidgetStateProperty.all(Colors.blue),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0), // 角の丸みを指定
                  ),
                ),
              ),
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                '更新する',
                style: TextStyle(fontSize: 18),
              ),
            )),
          ])
        ],
      ),
    );
  }
}
