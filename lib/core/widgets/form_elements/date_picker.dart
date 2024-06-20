import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.errorLabel,
  });

  final String hintText;
  final Function onChanged;
  final String errorLabel;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final TextEditingController _dateController = TextEditingController();
  //final DateTime? pickedDate;

  Future showDate(BuildContext context) async {
    DateTime? pickTime = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (pickTime != null) {
      setState(() {
        _dateController.text = DateFormat('d/M/y').format(pickTime);
        widget.onChanged(_dateController.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter ${widget.errorLabel} value';
        }
        return null;
      },
      controller: _dateController,
      readOnly: true,
      onTap: () => showDate(context),
      style: GoogleFonts.roboto(
          textStyle: const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        decorationThickness: 0,
      )),
      cursorColor: Theme.of(context).colorScheme.primaryContainer,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.calendar_today,
          size: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline, width: 1),
        ),
      ),
    );
  }
}
