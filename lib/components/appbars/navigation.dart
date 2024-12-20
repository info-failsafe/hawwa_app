import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String text;
  final VoidCallback onPressed;

  const NavigationAppBar(
      {super.key, required this.text, required this.onPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: onPressed),
        Builder(
            builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer())),
      ],
    );
  }
}
