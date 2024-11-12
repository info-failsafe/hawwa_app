import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/components/views/update.dart';

class EditButton extends ConsumerWidget {
  final int id;
  final Column column;

  const EditButton({
    super.key,
    required this.id,
    required this.column,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      // 中央寄せ
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.blue)),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) =>
                  UpdateView(id: 2, column: column)),
          // onPressed: () => showDialog(
          //     //編集タップ時のダイアログ
          //     context: context,
          //     builder: (BuildContext context) => Dialog.fullscreen(
          //           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          //           // child: column,
          //           child: Column(
          //             children: [column],
          //           ),
          //         )),
          child: const Text('編集'),
        ),
      ],
    );
  }
}
