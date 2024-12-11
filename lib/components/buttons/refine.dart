import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/constants.dart';

final filterButtonProvider = StateProvider((ref) => false);

class RefineButton extends ConsumerStatefulWidget {
  final Widget child;

  const RefineButton({
    super.key,
    required this.child,
  });

  @override
  RefineButtonState createState() => RefineButtonState();
}

// class RefineButton extends ConsumerWidget {
class RefineButtonState extends ConsumerState<RefineButton> {
  @override
  Widget build(BuildContext context) {
    Constants.logger.d('test');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.blue)),
              onPressed: () {
                // if (ref.watch(filterButtonProvider)) {
                //   ref.read(filterButtonProvider.notifier).state = false;
                // } else {
                //   ref.read(filterButtonProvider.notifier).state = true;
                // }
                ref.read(filterButtonProvider.notifier).state =
                    !ref.read(filterButtonProvider);
              },
              label: const Text('条件'),
              icon: ref.watch(filterButtonProvider)
                  ? const Icon(Icons.expand_less)
                  : const Icon(Icons.expand_more),
            ),
          ),
        ),
        if (ref.watch(filterButtonProvider)) widget.child,
      ],
    );
  }
}
