import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/screen/dialog/remove.dart';

class ControllerView extends ConsumerWidget {
  // final int id;

  const ControllerView({
    super.key,
    // required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Container(
        // color: const Color.fromARGB(255, 202, 243, 236),
        padding: const EdgeInsetsDirectional.all(8.0),
        color: Theme.of(context).primaryColorLight,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // これでこれで両端に寄せる
          children: [
            Row(
              children: [
                TextButton.icon(
                  style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.blue)),
                  onPressed: () {},
                  label: const Text('全て選択'),
                  icon: const Icon(Icons.check_box),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.blue)),
                  onPressed: () {},
                  label: const Text('全て解除'),
                  icon: const Icon(Icons.check_box_outline_blank),
                ),
              ],
            ),
            // TextButton.icon(
            //   style: ButtonStyle(
            //       foregroundColor: WidgetStateProperty.all(Colors.grey)),
            //   onPressed: () => showDialog(
            //     //編集タップ時のダイアログ
            //     context: context,
            //     builder: (BuildContext context) => const RemoveDialog(id: 1),
            //   ),
            //   label: const Text('全て削除'),
            //   icon: const Icon(Icons.delete),
            // ),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      )
      // SizedBox(
      //   width: MediaQuery.of(context).size.width,
      //   child: Column(
      //     children: [
      //       Align(
      //         key: key,
      //         alignment: Alignment.centerLeft,
      //         child: Padding(
      //           key: key,
      //           padding: const EdgeInsets.only(
      //               top: 16.0, right: 20.0, bottom: 16.0, left: 24.0),
      //           child: Text(
      //             key: key,
      //             '100件のうち、1～20件を表示',
      //             style: const TextStyle(color: Colors.blueGrey),
      //           ),
      //         ),
      //       ),
      //       // )
      //     ],
      //   ),
      // ),
    ]);
  }
}
