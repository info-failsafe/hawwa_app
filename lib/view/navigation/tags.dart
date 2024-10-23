// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:hawwa_app/freezed/tag.dart';

import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/view/drawers/header.dart';
import 'package:hawwa_app/components/listviews/card.dart';
import 'package:hawwa_app/components/buttons/edit.dart';

final logger = Logger();

final filterButtonProvider = StateProvider((ref) => false);
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
      appBar: AppBar(
        title: const Text('header title'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                tagListNotifier.add(Tag(
                    id: 1, org_id: 1, flag: 2, name: 'test', checked: false));
              }),
          Builder(
              builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openEndDrawer())),
        ],
      ),
      endDrawer: HeaderDrawer(),
      body: Column(children: [
        SizedBox(width: MediaQuery.of(context).size.width, height: 16),
        FilterTextField(onChanged: (text) {}),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.blue)),
              onPressed: () {
                if (ref.watch(filterButtonProvider)) {
                  ref.read(filterButtonProvider.notifier).state = false;
                } else {
                  ref.read(filterButtonProvider.notifier).state = true;
                }
              },
              label: const Text('条件で絞り込んで表示'),
              icon: ref.watch(filterButtonProvider)
                  ? const Icon(Icons.expand_less)
                  : const Icon(Icons.expand_more),
            ),
          ),
        ),
        ref.watch(filterButtonProvider)
            ? const SizedBox(height: 300)
            : const SizedBox(height: 0),
        Container(
          color: const Color.fromARGB(255, 202, 243, 236),
          child: Row(
            // 中央寄せ
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.blue)),
                onPressed: () {},
                label: const Text('次へ'),
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // color: const Color.fromARGB(255, 240, 239, 239),
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
                    style: const TextStyle(color: Colors.blueGrey), //文字色ピンク
                  ),
                ),
              ),
              // AlertDialog(
              //   title: Text('データを消してしまってもいいですか？'),
              //   content: Text('こうかいしませんね？'),
              //   actions: <Widget>[
              //     GestureDetector(
              //       child: Text('いいえ'),
              //       onTap: () {},
              //     ),
              //     GestureDetector(
              //       child: Text('はい'),
              //       onTap: () {},
              //     )
              //   ],
              // )
            ],
          ),
        ),
        Expanded(
            child: CardListView(
          itemCount: ref.watch(tagListProvider).length,
          item: Padding(
              padding:
                  EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
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
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Column(
                              children: [
                                EditButtons(itemCount: 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
