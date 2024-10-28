// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:hawwa_app/freezed/tag.dart';

import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/screen/drawers/header.dart';
import 'package:hawwa_app/components/listviews/card.dart';
import 'package:hawwa_app/components/buttons/edit.dart';
import 'package:hawwa_app/components/buttons/remove.dart';
import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/components/views/paging.dart';
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

  void change(id, column) {}
}

class Tags extends ConsumerWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<Tag> tagList = ref.watch(tagListProvider);
    TagListNotifier tagListNotifier = ref.read(tagListProvider.notifier);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('タグ管理'),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //         icon: const Icon(Icons.add),
      //         onPressed: () {
      //           tagListNotifier.add(const Tag(
      //               id: 1, org_id: 1, flag: 2, name: 'test', checked: false));
      //         }),
      //     Builder(
      //         builder: (context) => IconButton(
      //             icon: const Icon(Icons.menu),
      //             onPressed: () => Scaffold.of(context).openEndDrawer())),
      //   ],
      // ),

      // appBar: NavigationAppBar(text: 'タグ管理'),
      appBar: NavigationAppBar(
          text: 'タグ管理',
          onPressed: () {
            tagListNotifier.add(const Tag(
                id: 1, org_id: 1, flag: 2, name: 'test', checked: false));
          }),

      // NavigationAppBar(text: 'aaaaaaaaaaa'),

      endDrawer: const HeaderDrawer(),
      body: Column(children: [
        SizedBox(width: MediaQuery.of(context).size.width, height: 16),
        FilterTextField(onChanged: (text) {}),
        const SizedBox(height: 8),
        RefineButton(), // 条件で絞り込んで表示
        PagingArea(), // 次へ
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Align(
                key: key,
                alignment: Alignment.centerLeft,
                child: Padding(
                  key: key,
                  padding: const EdgeInsets.only(
                      top: 16.0, right: 20.0, bottom: 16.0, left: 24.0),
                  child: Text(
                    key: key,
                    '100件のうち、1～20件を表示',
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
              // )
            ],
          ),
        ),

        Expanded(
            child: CardListView(
          itemCount: ref.watch(tagListProvider).length,
          item: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // これで両端に寄せる
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
              ])),
        )),
      ]),
    );
  }
}
