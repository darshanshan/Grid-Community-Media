import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.errorLabel,
    required this.dropDownValues,
  });

  final String hintText;
  final Function onChanged;
  final String errorLabel;
  final List<String> dropDownValues;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? _selectedText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter ${widget.errorLabel} value ';
          }
          return null;
        },
        value: _selectedText,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 16,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintStyle: Theme.of(context).textTheme.bodySmall,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer),
          ),
        ),
        items: widget.dropDownValues
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedText = value;
          });
          if (value != null) {
            widget
                .onChanged(value); // Call the callback with the selected value
          }
        });
  }
}
