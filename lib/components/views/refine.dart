import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterButtonProvider = StateProvider((ref) => false);

class RefineButton extends ConsumerWidget {
  // final int id;

  const RefineButton({
    super.key,
    // required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.blue)),
            onPressed: () {
              if (ref.watch(filterButtonProvider)) {
                ref.read(filterButtonProvider.notifier).state = false;
              } else {
                ref.read(filterButtonProvider.notifier).state = true;
              }
            },
            label: const Text('条件で絞り込んで表示'),
            icon: ref.watch(filterButtonProvider)
                ? const Icon(Icons.expand_less)
                : const Icon(Icons.expand_more),
          ),
        ),
      ),
      ref.watch(filterButtonProvider)
          ? const SizedBox(height: 300)
          : const SizedBox(height: 0),
    ]);
  }
}
