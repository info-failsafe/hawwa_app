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
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          print('Button Tapped');
        },
        // onTap: widget.onTap,
        // onTap: () {
        //   setState(() => color = Colors.red);
        //   widget.onTap();
        // },
        // onTapDown: (details) {
        //   setState(() => color = Colors.red);
        //   widget.onTap();
        // },
        // onTapUp: (details) => setState(() => color = Colors.blue),
        child: Container(
          // color: color,
          child: widget.child,
        ),
      ),
    );
  }
}
