import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hawwa_app/screen/dialog/remove.dart';

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
          builder: (BuildContext context) => RemoveDialog(id: 1)),
    );
  }
}
