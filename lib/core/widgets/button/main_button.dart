import 'package:flutter/material.dart';
import 'package:grid/core/widgets/loading_indicator/button_loading.dart';

class MainButton extends StatefulWidget {
  const MainButton({
    super.key,
    required this.hintText,
    required this.onPressed,
    required this.isLoading,
  });
  final String hintText;
  final Function() onPressed;
  final bool isLoading;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.isLoading
            ? null
            : () async {
                widget.onPressed();
              },
        child: widget.isLoading ? const ButtonLoading() : Text(widget.hintText),
      ),
    );
  }
}
