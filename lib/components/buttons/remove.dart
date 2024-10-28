import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemoveButton extends ConsumerWidget {
  final int id;
  // final Column column;

  const RemoveButton({
    super.key,
    required this.id,
    // required this.column,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return IconButton(
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
                        foregroundColor: WidgetStateProperty.all(Colors.blue)),
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('キャンセル'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.red)),
                    child: const Text('削除'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )),
    );
  }
}
