// import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/components/containers/card.dart';
import 'package:logger/logger.dart';

import 'package:hawwa_app/freezed/tag.dart';

import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/screen/drawers/header.dart';
import 'package:hawwa_app/components/buttons/edit.dart';
import 'package:hawwa_app/components/buttons/remove.dart';
import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/components/views/controller.dart';
import 'package:hawwa_app/components/views/refine.dart';
import 'package:hawwa_app/components/appbars/navigation.dart';

final logger = Logger();

// final filterButtonProvider = StateProvider((ref) => false);
final tagListProvider = StateNotifierProvider<TagListNotifier, List<Tag>>(
    (ref) => TagListNotifier());

class TagListNotifier extends StateNotifier<List<Tag>> {
  TagListNotifier() : super([]);

  void add(Tag tag) {
    state = [...state, tag];
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

class Tags extends ConsumerWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<Tag> tagList = ref.watch(tagListProvider);
    TagListNotifier tagListNotifier = ref.read(tagListProvider.notifier);

    return Scaffold(
      appBar: NavigationAppBar(
          text: 'タグ管理',
          onPressed: () {
            tagListNotifier.add(const Tag(
                id: 1,
                org_id: 1,
                flag: 2,
                name: 'タグ名称',
                remarks: 'ここに備考が入ります。',
                checked: false));
          }),

      // NavigationAppBar(text: 'aaaaaaaaaaa'),

      endDrawer: const HeaderDrawer(),
      body: Column(children: [
        SizedBox(width: MediaQuery.of(context).size.width, height: 16),
        FilterTextField(onChanged: (text) {}),
        const SizedBox(height: 8),
        const RefineButton(), // 条件で絞り込んで表示
        const PagingArea(), // 全て選択

        Expanded(
            child: ListView.builder(
          itemCount: ref.watch(tagListProvider).length,
          itemBuilder: (ctx, idx) => CardContainer(
              child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // これで両端に寄せる
              children: [
                Checkbox(
                  value: ref.watch(tagListProvider)[idx].checked,
                  activeColor: Colors.blue,
                  onChanged: (bool? value) =>
                      tagListNotifier.change(idx, 'checked', value),
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
                          ],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const RemoveButton(id: 1),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 0.0, bottom: 8.0, left: 16.0, right: 16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key: key,
                    ref.watch(tagListProvider)[idx].name,
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ), //タグ名称
                  const SizedBox(height: 8.0),

                  if (ref.watch(tagListProvider)[idx].remarks.isNotEmpty)
                    Text(
                      key: key,
                      ref.watch(tagListProvider)[idx].remarks,
                      style: const TextStyle(color: Colors.grey),
                    ), //備考
                ],
              ),
            ),
          ])),
        )),
      ]),
    );
  }
}
