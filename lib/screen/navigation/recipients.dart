import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/components/containers/card.dart';

import 'package:hawwa_app/freezed/recipient.dart';

import 'package:hawwa_app/components/textfields/filter.dart';
import 'package:hawwa_app/components/views/controller.dart';
import 'package:hawwa_app/components/views/refine.dart';
import 'package:hawwa_app/components/appbars/navigation.dart';
import 'package:hawwa_app/components/buttons/remove.dart';
import 'package:hawwa_app/components/buttons/edit.dart';
import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/screen/drawers/header.dart';

final filterTextProvider = StateProvider<String>((ref) => '');
final recipientListProvider =
    StateNotifierProvider<RecipientListNotifier, List<Recipient>>(
        (ref) => RecipientListNotifier());

class RecipientListNotifier extends StateNotifier<List<Recipient>> {
  RecipientListNotifier() : super([]);

  void add(Recipient recipient) {
    state = [...state, recipient];
  }

  void remove(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
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

  // 一括でチェックを入れるメソッド
  void changeAll() {
    state = [
      for (int i = 0; i < state.length; i++) state[i].copyWith(checked: true)
    ];
  }

  // 一括でチェックを解除するメソッド
  void cancelAll() {
    state = [
      for (int i = 0; i < state.length; i++) state[i].copyWith(checked: false)
    ];
  }
}

class Recipients extends ConsumerWidget {
  const Recipients({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RecipientListNotifier recipientListNotifier =
        ref.read(recipientListProvider.notifier);

    final recipients = ref.watch(recipientListProvider);
    // チェックされているアイテムが1つ以上あるかどうかを確認
    final bool hasCheckedItems = recipients.any((monitor) => monitor.checked);

    return Scaffold(
      appBar: NavigationAppBar(
        text: '受信設定',
        onPressed: () {
          recipientListNotifier.add(const Recipient(
              id: 1,
              org_id: 1,
              flag: 2,
              name: 'sample@co.jp',
              checked: false,
              limited: 200,
              usage: 2));
        },
      ),
      endDrawer: const HeaderDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width, height: 16),
            FilterTextField(
              onChanged: (text) =>
                  ref.read(filterTextProvider.notifier).state = text,
              onPressed: () => ref.read(filterTextProvider.notifier).state = '',
              text: ref.watch(filterTextProvider),
            ),
            const SizedBox(height: 8),
            const RefineButton(), // 条件で絞り込んで表示
            ControllerView(
              onPressedCancel: () {
                ref.read(recipientListProvider.notifier).cancelAll();
              },
              onPressedSelect: () {
                ref.read(recipientListProvider.notifier).changeAll();
              },
              onPressedDelete: () {
                for (int i =
                        ref.read(recipientListProvider.notifier).state.length -
                            1;
                    i >= 0;
                    i--) {
                  ref.read(recipientListProvider.notifier).remove(i);
                }
              },
              hasCheckedItems: hasCheckedItems,
            ),

            Expanded(
                child: ListView.builder(
              itemCount: ref.watch(recipientListProvider).length,
              itemBuilder: (ctx, idx) => CardContainer(
                  child: Column(children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // これで両端に寄せる
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          // value: ref.watch(listProvider),
                          // value: false,
                          value: ref.watch(recipientListProvider)[idx].checked,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) => recipientListNotifier
                              .change(idx, 'checked', value),
                        ),
                        const Text(
                          '回数制限　',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                            '${ref.watch(recipientListProvider)[idx].usage} 回 / ${ref.watch(recipientListProvider)[idx].limited} 回'),
                      ],
                    ),
                    Row(
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
                        // const RemoveButton(id: 1),
                        RemoveButton(
                            onPressed: () => ref
                                .read(recipientListProvider.notifier)
                                .remove(idx)),
                      ],
                    ),
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
                        const SizedBox(width: 8.0),
                        Text(
                          key: key,
                          ref.watch(recipientListProvider)[idx].name,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18.0),
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
