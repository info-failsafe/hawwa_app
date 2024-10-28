import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderDrawer extends ConsumerWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Theme.of(context).cardColor,
      child: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 100.0,
            child: UserAccountsDrawerHeader(
              accountName: const Text('ユーザー名'),
              accountEmail: const Text('info@example.com'),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('パスワード変更'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            textColor: Colors.white,
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              // Do something
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('メッセージ受信設定'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            textColor: Colors.white,
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              // Do something
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.label),
            title: const Text('タグ管理'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            textColor: Colors.white,
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              // Do something
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('死活監視'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            textColor: Colors.white,
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              // Do something
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('ログアウト'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            textColor: Colors.white,
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              // Do something
              Navigator.pop(context);
            },
          ),
        ],
      )),
    );
  }
}
