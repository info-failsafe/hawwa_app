import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/screen/navigation/tags.dart';

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
      content: Text("削除した$idコンテンツはゴミ箱に移動します。"),
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
            ref.read(tagListProvider.notifier).remove(id);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
