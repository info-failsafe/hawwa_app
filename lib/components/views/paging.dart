import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PagingArea extends ConsumerWidget {
  // final int id;

  const PagingArea({
    super.key,
    // required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Container(
        // color: const Color.fromARGB(255, 202, 243, 236),
        color: Theme.of(context).primaryColorLight,
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
      SizedBox(
        width: MediaQuery.of(context).size.width,
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
                  style: const TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
            // )
          ],
        ),
      ),
    ]);
  }
}
