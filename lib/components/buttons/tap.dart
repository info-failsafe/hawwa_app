import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class ColorProvider with ChangeNotifier {
//   Color _color = Colors.blue;
//   Color get color => _color;
//   void toggleColor() {
//     _color = _color == Colors.blue ? Colors.red : Colors.blue;
//     notifyListeners();
//   }
// }

class TapButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const TapButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  TapButtonState createState() => TapButtonState();
}

class TapButtonState extends State<TapButton> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
            child: widget.child,
          ),
        ),
      ),
    );

    // return Container(
    //

    //   child: InkWell(
    //     onTap: () {
    //       print('Button Tapped');
    //     },
    //     // onTap: widget.onTap,
    //     // onTap: () {
    //     //   setState(() => color = Colors.red);
    //     //   widget.onTap();
    //     // },
    //     // onTapDown: (details) {
    //     //   setState(() => color = Colors.red);
    //     //   widget.onTap();
    //     // },
    //     // onTapUp: (details) => setState(() => color = Colors.blue),
    //     // child: Container(
    //     //   // color: color,
    //     //   color: Colors.white,
    //     //   child: widget.child,
    //     // ),
    //     child: Material(
    //       color: Colors.white,
    //       child: Container(
    //         child: widget.child,
    //       ),
    //     ),
    //   ),
    // );
  }
}
