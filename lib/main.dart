import 'package:flutter/material.dart';

void main() {
  runApp(const HawwaApp());
}

class HawwaApp extends StatelessWidget {
  const HawwaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HAWWA',
        theme: ThemeData.light().copyWith(
            primaryColor: Color.fromRGBO(0, 165, 162, 1),
            textTheme:
                ThemeData.light().textTheme.apply(fontFamily: 'Murecho')),
        darkTheme: ThemeData.dark(),
        home: Scaffold(body: Contents()));
  }
}

class Contents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Logo(),
          SizedBox(height: 32),
          CustomTextField(
              labelText: 'E-mail', hintText: 'メールアドレス', obscureText: false),
          SizedBox(height: 16),
          CustomTextField(
              labelText: 'password', hintText: 'パスワード', obscureText: true),
          SizedBox(height: 32),
          GradientButton(
            text: 'ログイン',
            onPressed: () {},
            // style: ButtonStyle(
            //     minimumSize: MaterialStateProperty.all(
            //         Size(MediaQuery.of(context).size.width * 0.4, 48))),
          ),
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.help,
                color: Theme.of(context).primaryColor,
                size: 24,
                semanticLabel: 'Text Label',
              ),
              SizedBox(width: 8),
              Text('パスワードをお忘れの方はこちら'),
            ],
          ),
          SizedBox(height: 64),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width * 0.6, 60))),
            child: Text('新規登録はこちら'),
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '死活監視',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          letterSpacing: 8,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        obscureText: obscureText,
        // onTap: () {},
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GradientButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(131, 132, 240, 1),
              Color.fromRGBO(255, 72, 108, 1)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(64),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
