import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoveDialog extends ConsumerWidget {
  final int id;

  const RemoveDialog({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("削除しますか？"),
      content: const Text("削除したコンテンツはゴミ箱に移動します。"),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.blue)),
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('キャンセル'),
        ),
        TextButton(
          style:
              ButtonStyle(foregroundColor: WidgetStateProperty.all(Colors.red)),
          child: const Text('削除'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
