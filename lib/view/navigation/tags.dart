// import 'package:flutter/foundation.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/freezed/tag.dart';

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
    List<Tag> tagList = ref.watch(tagListProvider);
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
      endDrawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.green),
        child: Drawer(
          child: SafeArea(
              child: ListView(
            children: [
              SizedBox(
                height: 100.0,
                child: const UserAccountsDrawerHeader(
                  accountName: Text('ユーザー名'),
                  accountEmail: Text('info@example.com'),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(43, 63, 84, 1)),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.border_color),
                title: const Text('パスワード変更'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('メッセージ受信設定'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.label),
                title: const Text('タグ管理'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.visibility),
                title: const Text('死活監視'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('ログアウト'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
            ],
          )),
        ),
      ),
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
              // ListView.builder(
              // itemCount: 4,
              // itemBuilder: (context, index) => Container(
              //       width: MediaQuery.of(context).size.width - 32,
              //       color: const Color.fromARGB(255, 255, 255, 255),
              //       child: Padding(
              //           padding: const EdgeInsets.only(
              //               top: 8, right: 0, bottom: 8, left: 0),
              //           child: Column(children: [
              //             Row(
              //               mainAxisAlignment:
              //                   MainAxisAlignment.spaceBetween, // これで両端に寄せる
              //               children: [
              //                 Checkbox(
              //                   // value: ref.watch(listProvider),
              //                   value: false,
              //                   activeColor: Colors.blue,
              //                   onChanged: (bool? value) {},
              //                 ),
              //                 Container(
              //                   child: Row(
              //                     children: [
              //                       TextButton(
              //                         onPressed: () {/* ボタンがタップされた時の処理 */},
              //                         style: ButtonStyle(
              //                             foregroundColor:
              //                                 WidgetStateProperty.all(
              //                                     Colors.blue)),
              //                         child: const Text('編集'),
              //                       ),
              //                       IconButton(
              //                           icon: const Icon(Icons.delete),
              //                           color: Colors.grey,
              //                           onPressed: () {}),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Align(
              //               key: key,
              //               alignment: Alignment.centerLeft,
              //               child: Padding(
              //                 key: key,
              //                 padding: const EdgeInsets.only(
              //                     top: 16, right: 16, bottom: 16, left: 16),
              //                 child: Text(
              //                   key: key,
              //                   'タグ名テキスト',
              //                   style: const TextStyle(
              //                       color: Colors.black), //文字色ピンク
              //                 ),
              //               ),
              //             ),
              //           ])),
              //     )),
              Container(
                width: MediaQuery.of(context).size.width - 32,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, right: 0, bottom: 8, left: 0),
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
                                  child: Container(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, right: 0, bottom: 8, left: 0),
                                      child: Column(
                                        children: [
                                          Row(
                                            // 中央寄せ
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton.icon(
                                                style: ButtonStyle(
                                                    foregroundColor:
                                                        WidgetStateProperty.all(
                                                            Colors.blue)),
                                                onPressed: () => showDialog(
                                                    //編集タップ時のダイアログ
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                          title: const Text(
                                                              "Notifications"),
                                                          content: const Text(
                                                              "Do you allow notifications?"),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context,
                                                                      'Cancel'),
                                                              child: const Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              child: const Text(
                                                                  'Approve'),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ],
                                                        )),
                                                label: const Text('編集'),
                                                icon: const Icon(
                                                    Icons.chevron_right),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: Colors.grey,
                                    onPressed: () {}),
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
                            style:
                                const TextStyle(color: Colors.black), //文字色ピンク
                          ),
                        ),
                      ),
                    ])),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 24),
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
      ]),
    );
  }
}
