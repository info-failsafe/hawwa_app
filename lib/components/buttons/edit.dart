import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditButtons extends ConsumerWidget {
  final int itemCount;

  const EditButtons({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      // 中央寄せ
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.blue)),
          onPressed: () => showDialog(
              //編集タップ時のダイアログ
              context: context,
              builder: (BuildContext context) => Dialog.fullscreen(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStateProperty.all(
                                      Size(180, 40)), // 幅,高
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.grey),
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.white)),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('キャンセル'),
                            ),
                            SizedBox(width: 16.0),
                            TextButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStateProperty.all(
                                      Size(180, 40)), // 幅,高
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.blue),
                                  foregroundColor:
                                      WidgetStateProperty.all(Colors.white)),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('更新する'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
          label: const Text('編集'),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.grey,
          onPressed: () => showDialog(
              //編集タップ時のダイアログ
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text("削除しますか？"),
                    content: const Text("削除したコンテンツはゴミ箱に移動します。"),
                    actions: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                WidgetStateProperty.all(Colors.blue)),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('キャンセル'),
                      ),
                      TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                WidgetStateProperty.all(Colors.red)),
                        child: const Text('削除'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )),
        ),
      ],
    );
  }
}
