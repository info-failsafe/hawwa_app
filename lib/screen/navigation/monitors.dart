import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hawwa_app/components/textfields/custom.dart';

class Monitors extends ConsumerWidget {
  const Monitors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(width: MediaQuery.of(context).size.width),
        CustomTextField(
          labelText: 'E-mail',
          hintText: 'メールアドレス',
          obscureText: false,
          onChanged: (text) {},
        )
      ])),
    );
  }
}
