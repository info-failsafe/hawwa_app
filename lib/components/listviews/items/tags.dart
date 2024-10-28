import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/components/buttons/edit.dart';
import 'package:hawwa_app/components/buttons/remove.dart';
import 'package:hawwa_app/components/textfields/custom.dart';

class TagsItem extends ConsumerWidget {
  final int index;
  TagsItem({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // これで両端に寄せる
            children: [
              Checkbox(
                // value: ref.watch(listProvider),
                value: false,
                activeColor: Colors.blue,
                onChanged: (bool? value) {},
              ),
              Container(
                  child: Row(
                // 中央寄せ
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  EditButton(
                    id: 1,
                    // 編集タップ時のダイアログ
                    column: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        CustomTextField(
                          labelText: 'タグ名',
                          hintText: '#タグ',
                          obscureText: false,
                          onChanged: (text) {},
                        ),
                        const SizedBox(height: 24.0),
                        const SizedBox(height: 24.0),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const RemoveButton(id: 1),
                ],
              )),
            ],
          ),
          Align(
            key: key,
            alignment: Alignment.centerLeft,
            child: Padding(
              key: key,
              padding: const EdgeInsets.only(
                  top: 16, right: 16, bottom: 16, left: 16),
              child: Text(
                key: key,
                'タグ名テキスト',
                style: const TextStyle(color: Colors.black), //文字色ピンク
              ),
            ),
          ),
        ]));
  }
}
