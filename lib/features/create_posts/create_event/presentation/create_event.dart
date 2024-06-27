import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:grid/core/widgets/button/cancel_button.dart';
import 'package:grid/core/widgets/button/save_button.dart';
import 'package:grid/core/widgets/form_elements/date_picker.dart';
import 'package:grid/core/widgets/form_elements/textfield.dart';
import 'package:grid/core/widgets/form_elements/time_picker.dart';
import 'package:grid/core/widgets/snackBar/primary_snackbar.dart';
import 'package:grid/features/create_posts/create_event/bloc/create_event_bloc.dart';

import 'package:grid/features/create_posts/widgets/headline_text.dart';
import 'package:image_picker/image_picker.dart';

enum Registration { open, closed }

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime? date;
  DateTime? time;
  XFile? pickedImage;

  void _pickImage() async {
    final imagePicker = ImagePicker().pickImage(source: ImageSource.gallery);
    final image = await imagePicker;
    if (image != null) {
      setState(() {
        pickedImage = image;
      });
    } else {
      null;
    }
  }

  Registration? registration = Registration.open;
  @override
  Widget build(BuildContext context) {
    final TextEditingController eventTitle = TextEditingController();
    final TextEditingController eventdescription = TextEditingController();
    final TextEditingController eventType = TextEditingController();
    final TextEditingController link = TextEditingController();
    final TextEditingController location = TextEditingController();
    final TextEditingController clubName = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return BlocListener<CreateEventBloc, CreateEventState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pop(context);
        }
        if (state is ErrorState) {
          customSnackBar(context, state.errorLabel);
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
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

              // Title----------------------------------------------------

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

              // Description----------------------------------------------------

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

              // Date----------------------------------------------------

              const HeadLineText(
                labelText: 'Date',
              ),
              const Gap(10),
              DatePickerWidget(
                  hintText: 'Select event date',
                  onChanged: (DateTime selectedDate) {
                    setState(() {
                      date = selectedDate;
                    });
                  },
                  errorLabel: 'date'),
              const Gap(15),

              // Time----------------------------------------------------

              const HeadLineText(
                labelText: 'Time',
              ),
              const Gap(10),
              TimePickerWidget(
                  onChanged: (DateTime selectedTime) {
                    setState(() {
                      time = selectedTime;
                    });
                  },
                  errorLabel: 'time',
                  hintText: 'Select event time'),
              const Gap(15),

              // Image ----------------------------------------------------

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
                    if (pickedImage != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(pickedImage!.path),
                          // 'https://t3.ftcdn.net/jpg/02/70/35/00/360_F_270350073_WO6yQAdptEnAhYKM5GuA9035wbRnVJSr.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (pickedImage == null)
                      GestureDetector(
                        onTap: () => _pickImage(),
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
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const Gap(15),

              // Event Type----------------------------------------------------

              const HeadLineText(
                labelText: 'Event Type',
              ),
              const Gap(10),
              TextFieldWidget(
                controller: eventTitle,
              ),
              const Gap(15),

              // Location----------------------------------------------------

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

              // Location----------------------------------------------------

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

              // Club Name----------------------------------------------------

              const HeadLineText(
                labelText: 'Club Name',
              ),
              const Gap(10),
              TextFieldWidget(
                controller: eventTitle,
              ),
              const Gap(15),

              // registrations----------------------------------------------------

              const HeadLineText(
                labelText: 'Registrations',
              ),
              Row(
                children: [
                  Radio(
                      activeColor:
                          Theme.of(context).colorScheme.primaryContainer,
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
                      activeColor:
                          Theme.of(context).colorScheme.primaryContainer,
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

              // Buttons----------------------------------------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CancelButton(
                      labelText: 'Cancel',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const Gap(10),
                  BlocBuilder<CreateEventBloc, CreateEventState>(
                    builder: (context, state) {
                      return SaveButton(
                          labelText: 'Create',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if ((date != null) &&
                                  (time != null) &&
                                  (pickedImage != null)) {
                                context.read<CreateEventBloc>().add(
                                      CreatingEvent(
                                        title: eventTitle.text.trim(),
                                        date: date!,
                                        time: time!,
                                        description:
                                            eventdescription.text.trim(),
                                        coverImage: pickedImage!,
                                        eventType: eventType.text.trim(),
                                        location: location.text.trim(),
                                        eventLink: link.text.trim(),
                                        clubName: clubName.text.trim(),
                                        registrations: registration.toString(),
                                      ),
                                    );
                              } else {
                                context.read<CreateEventBloc>().add(ErrorEvent(
                                    errorText:
                                        'Fill required fields to create...'));
                              }
                            }
                          },
                          isLoading: state is SuccessState);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
