import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import 'package:hawwa_app/constants.dart';
import 'package:hawwa_app/screen/navigation.dart';
import 'package:hawwa_app/components/logo.dart';
import 'package:hawwa_app/components/textfields/custom.dart';
import 'package:hawwa_app/components/buttons/gradient.dart';

final emailProvider = StateProvider<String>((ref) => 'teshima@failsafe.jp');
final passwordlProvider = StateProvider<String>((ref) => 'xX0niZhkgMpb');
final buttonProvider = StateProvider<bool>((ref) => true);
final errorProvider = StateProvider<bool>((ref) => false);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      child: MaterialApp(
          title: 'HAWWA',
          theme: ThemeData.light().copyWith(
              primaryColor: const Color.fromRGBO(0, 165, 162, 1),
              scaffoldBackgroundColor: const Color.fromRGBO(241, 251, 253, 1),
              cardColor: const Color.fromRGBO(43, 63, 84, 1),
              // focusColor: const Color.fromARGB(255, 206, 255, 255),
              primaryColorLight: const Color.fromARGB(255, 202, 243, 236),
              hintColor: const Color.fromRGBO(255, 217, 225, 1),
              textTheme:
                  ThemeData.light().textTheme.apply(fontFamily: 'Murecho')),
          darkTheme: ThemeData.dark(),
          home: const Scaffold(body: LogIn()))));
}

class LogIn extends ConsumerWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 96),
          const Logo(),
          const SizedBox(height: 32),
          CustomTextField(
              labelText: 'E-mail',
              hintText: 'メールアドレス',
              obscureText: false,
              onChanged: (text) =>
                  ref.read(emailProvider.notifier).state = text),
          const SizedBox(height: 16),
          CustomTextField(
              labelText: 'password',
              hintText: 'パスワード',
              obscureText: true,
              onChanged: (text) =>
                  ref.read(passwordlProvider.notifier).state = text),
          const SizedBox(height: 32),
          GradientButton(
            text: ref.watch(buttonProvider) ? 'ログイン' : '認証中',
            onPressed: ref.watch(buttonProvider)
                ? () async {
                    ref.read(errorProvider.notifier).state = false;
                    ref.read(buttonProvider.notifier).state = false;
                    Response response;
                    FormData data = FormData.fromMap({
                      'email': ref.watch(emailProvider),
                      'password': ref.watch(passwordlProvider),
                    });
                    Constants.dio.options.validateStatus =
                        (status) => status! < 400;
                    response = await Constants.dio.post(
                        '${Constants.apiDomain}/members/login/',
                        data: data);
                    var status = response.statusCode; // 302 ならログイン成功
                    if (status == 302) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navigation()));
                    } else {
                      // ここにエラー
                      ref.read(errorProvider.notifier).state = true;
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const Navigation()));
                    ref.read(buttonProvider.notifier).state = true;
                  }
                : () {},
            // style: ButtonStyle(
            //     minimumSize: MaterialStateProperty.all(
            //         Size(MediaQuery.of(context).size.width * 0.4, 48))),
          ),
          ref.watch(errorProvider)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.only(
                          top: 24.0, bottom: 24.0, left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor, // 背景色を指定
                        borderRadius: BorderRadius.circular(8.0), // ボーダーの丸みを指定
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                          'アカウントかパスワードが間違っています',
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                )
              : const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.help,
                color: Theme.of(context).primaryColor,
                size: 24,
                // semanticLabel: 'Text Label',
              ),
              const SizedBox(width: 8),
              Text(
                'パスワードをお忘れの方はこちら',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 32),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                // width: MediaQuery.of(context).size.width * 0.8,
                // style: ButtonStyle(
                //     minimumSize: MaterialStateProperty.all(
                //         Size(MediaQuery.of(context).size.width * 0.6, 60))),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.6, 60),
            ),
            child: Text('新規登録はこちら',
                style: TextStyle(color: Theme.of(context).primaryColor)),
          )
        ],
      ),
    );
  }
}
