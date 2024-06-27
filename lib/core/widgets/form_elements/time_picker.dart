import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget(
      {super.key,
      required this.errorLabel,
      required this.hintText,
      required this.onChanged});
  final String hintText;
  final String errorLabel;
  final Function onChanged;

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  final TextEditingController _timeController = TextEditingController();

  Future showTime(BuildContext context) async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      final DateTime now = DateTime.now();
      final selectedTime = DateTime(
          now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      widget.onChanged(selectedTime);

      setState(() {
        final String formatedTime = DateFormat.jm().format(selectedTime);
        _timeController.text = formatedTime;
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
      controller: _timeController,
      readOnly: true,
      onTap: () => showTime(context),
      style: GoogleFonts.roboto(
          textStyle: const TextStyle(
        fontSize: 14,
        decoration: TextDecoration.none,
        decorationThickness: 0,
      )),
      cursorColor: Theme.of(context).colorScheme.primaryContainer,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.access_time_rounded,
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
