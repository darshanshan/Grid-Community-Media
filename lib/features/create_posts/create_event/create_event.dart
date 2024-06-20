import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:grid/core/widgets/button/cancel_button.dart';
import 'package:grid/core/widgets/button/save_button.dart';
import 'package:grid/core/widgets/form_elements/date_picker.dart';
import 'package:grid/core/widgets/form_elements/textfield.dart';
import 'package:grid/core/widgets/form_elements/time_picker.dart';
import 'package:grid/features/create_posts/widgets/headline_text.dart';

enum Registration { open, closed }

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  Registration? registration = Registration.open;
  @override
  Widget build(BuildContext context) {
    final TextEditingController eventTitle = TextEditingController();
    final TextEditingController eventdescription = TextEditingController();

    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 18,
                ),
              ),
              const Gap(15),
              Text(
                'Post your thoughts',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const Gap(20),
          Divider(
            color: Theme.of(context).colorScheme.outline,
            thickness: 1,
          ),
          const Gap(20),
          const HeadLineText(
            labelText: 'Title',
          ),
          const Gap(10),
          TextFieldWidget(
            controller: eventTitle,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Title cannot be empty';
              }
              return null;
            },
          ),
          const Gap(15),
          const HeadLineText(
            labelText: 'Post Description',
          ),
          const Gap(10),
          TextFieldWidget(
            controller: eventdescription,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'post description cannot be empty';
              }
              return null;
            },
            hintText: 'Enter description...',
            maxLines: 3,
          ),
          const Gap(15),
          const HeadLineText(
            labelText: 'Date',
          ),
          const Gap(10),
          DatePickerWidget(
              hintText: 'Select event date',
              onChanged: () {},
              errorLabel: 'date'),
          const Gap(15),
          const HeadLineText(
            labelText: 'Time',
          ),
          const Gap(10),
          const TimePickerWidget(
              errorLabel: 'time', hintText: 'Select event time'),
          const Gap(15),
          const HeadLineText(
            labelText: 'Cover Image',
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              border: Border.all(
                  color: Theme.of(context).colorScheme.outline, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://t3.ftcdn.net/jpg/02/70/35/00/360_F_270350073_WO6yQAdptEnAhYKM5GuA9035wbRnVJSr.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_a_photo_outlined,
                          size: 34,
                        ),
                        const Gap(10),
                        Text(
                          'Click to pick an image',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          const HeadLineText(
            labelText: 'Event Type',
          ),
          const Gap(10),
          TextFieldWidget(
            controller: eventTitle,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Event type cannot be empty';
              }
              return null;
            },
          ),
          const Gap(15),
          const HeadLineText(
            labelText: 'Location',
          ),
          const Gap(10),
          TextFieldWidget(
            controller: eventTitle,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Location cannot be empty';
              }
              return null;
            },
          ),
          const Gap(15),
          const HeadLineText(
            labelText: 'Event Link',
          ),
          const Gap(10),
          TextFieldWidget(
            controller: eventTitle,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Event Link cannot be empty';
              }
              return null;
            },
          ),
          const Gap(15),
          const HeadLineText(
            labelText: 'Club Name',
          ),
          const Gap(10),
          TextFieldWidget(
            controller: eventTitle,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Club Name cannot be empty';
              }
              return null;
            },
          ),
          const Gap(15),
          const HeadLineText(
            labelText: 'Registrations',
          ),
          Row(
            children: [
              Radio(
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  value: Registration.open,
                  groupValue: registration,
                  onChanged: (value) {
                    setState(() {
                      registration = value;
                    });
                  }),
              Text(
                'Open',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Gap(15),
              Radio(
                  activeColor: Theme.of(context).colorScheme.primaryContainer,
                  value: Registration.closed,
                  groupValue: registration,
                  onChanged: (value) {
                    setState(() {
                      registration = value;
                    });
                  }),
              Text(
                'Closed',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const Gap(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CancelButton(
                  labelText: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const Gap(10),
              SaveButton(
                  labelText: 'Publish', onPressed: () {}, isLoading: false),
            ],
          ),
        ],
      ),
    );
  }
}
