import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/components/containers/card.dart';

import 'package:hawwa_app/freezed/recipient.dart';

import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/components/views/paging.dart';
import 'package:hawwa_app/components/views/refine.dart';
import 'package:hawwa_app/components/appbars/navigation.dart';
import 'package:hawwa_app/components/buttons/remove.dart';
import 'package:hawwa_app/components/buttons/edit.dart';
import 'package:hawwa_app/components/textfields/custom.dart';

final recipientListProvider =
    StateNotifierProvider<RecipientListNotifier, List<Recipient>>(
        (ref) => RecipientListNotifier());

class RecipientListNotifier extends StateNotifier<List<Recipient>> {
  RecipientListNotifier() : super([]);

  void add(Recipient recipient) {
    state = [...state, recipient];
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

class Recipients extends ConsumerWidget {
  const Recipients({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecipientListNotifier recipientListNotifier =
        ref.read(recipientListProvider.notifier);

    return Scaffold(
      appBar: NavigationAppBar(
          text: '受信設定',
          onPressed: () {
            recipientListNotifier.add(const Recipient(
                id: 1, org_id: 1, flag: 2, name: 'test', checked: false));
          }),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width, height: 16),
            FilterTextField(onChanged: (text) {}),
            const SizedBox(height: 8),
            const RefineButton(), // 条件で絞り込んで表示
            const PagingArea(), // 全て選択

            Expanded(
                child: ListView.builder(
              itemCount: ref.watch(recipientListProvider).length,
              itemBuilder: (ctx, idx) => CardContainer(
                  child: Column(children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // これで両端に寄せる
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            // value: ref.watch(listProvider),
                            // value: false,
                            value:
                                ref.watch(recipientListProvider)[idx].checked,
                            activeColor: Colors.blue,
                            onChanged: (bool? value) => recipientListNotifier
                                .change(idx, 'checked', value),
                          ),
                          const Text(
                            '回数制限　',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const Text('1'),
                          const Text('回 / 200回'),
                        ],
                      ),
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
                                labelText: '受信設定',
                                hintText: 'hawwa@co.jp',
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
                    )),
                  ],
                ),
                Align(
                  key: key,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    key: key,
                    padding: const EdgeInsets.only(
                        top: 8, right: 16, bottom: 16, left: 16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 2, left: 8, right: 8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            // border: Border.all(
                            //     color: Colors.blueGrey, width: 1.0),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            key: key,
                            'E-mail',
                            style: const TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          key: key,
                          'sample@co.jp',
                          style: const TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ])),
            )),
          ],
        ),
      ),
    );
  }
}