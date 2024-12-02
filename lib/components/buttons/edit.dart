import 'package:flutter/material.dart';

import 'package:hawwa_app/components/views/update.dart';

class EditButton extends StatelessWidget {
  final int id;
  final Column column;

  const EditButton({
    super.key,
    required this.id,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
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
          child: const Text('編集'),
        ),
      ],
    );
  }
}
