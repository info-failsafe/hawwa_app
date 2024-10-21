import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorLoginButtonProvider = StateProvider((ref) {
  return [
    const Color.fromRGBO(131, 132, 240, 1),
    const Color.fromRGBO(255, 72, 108, 1),
  ];
});

class GradientButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        ref.read(colorLoginButtonProvider.notifier).state = [
          const Color.fromRGBO(255, 72, 108, 1),
          const Color.fromRGBO(131, 132, 240, 1),
        ];
      },
      onTapUp: (TapUpDetails details) {
        ref.read(colorLoginButtonProvider.notifier).state = [
          const Color.fromRGBO(131, 132, 240, 1),
          const Color.fromRGBO(255, 72, 108, 1),
        ];
      },
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: ref.watch(colorLoginButtonProvider),
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(64),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
