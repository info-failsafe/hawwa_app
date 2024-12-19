import 'package:flutter/material.dart';
// import 'package:hawwa_app/constants.dart';

class FilterTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onPressed;
  final String text;

  const FilterTextField({
    super.key,
    required this.onChanged,
    required this.onPressed,
    required this.text,
  });

  @override
  State<FilterTextField> createState() => FilterTextFieldState();
}

class FilterTextFieldState extends State<FilterTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: TextField(
              controller: controller,
              onChanged: (text) {
                widget.onChanged(text);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                    onPressed: () {
                      widget.onPressed();
                      controller.clear();
                    },
                    icon: const Icon(Icons.clear)),
                filled: true,
                fillColor: Colors.white,
                // floatingLabelBehavior: FloatingLabelBehavior.always,
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
              // onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
