import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid/features/authentication/bloc/auth_bloc.dart';
import 'package:grid/core/widgets/form_elements/date_picker.dart';
import 'package:grid/core/widgets/form_elements/dropdown.dart';
import 'package:grid/features/authentication/presentation/login_screen/login.dart';
import 'package:grid/core/widgets/button/main_button.dart';
import 'package:grid/core/widgets/form_elements/password_field.dart';
import 'package:grid/core/widgets/form_elements/textfield.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _regNo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  String _selectedDepartment = '';
  String _selectedBatch = '';
  String _selectedDob = '';

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_password.text == _confirmPassword.text) {
        context.read<AuthBloc>().add(
              RegisterEvent(
                  batch: _selectedBatch,
                  registerNo: _regNo.text,
                  department: _selectedDepartment,
                  dob: _selectedDob,
                  email: _email.text,
                  password: _password.text),
            );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Passwords didn't match")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text('Setup Profile',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownWidget(
                    dropDownValues: const [
                      '2021-2024',
                      '2020-2023',
                      '2019-2022'
                    ],
                    errorLabel: 'Batch',
                    hintText: 'Select Batch',
                    onChanged: (value) {
                      _selectedBatch = value;
                    },
                  ),
                  const Gap(15),
                  TextFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Register number cannot be empty';
                        }
                        return null;
                      },
                      controller: _regNo,
                      hintText: 'Enter Register No...',
                      keyboard: TextInputType.text),
                  const Gap(15),
                  DropdownWidget(
                    dropDownValues: const ['IT', 'CSE', 'ECE', 'EEE'],
                    errorLabel: 'Department',
                    onChanged: (value) {
                      _selectedDepartment = value;
                    },
                    hintText: 'select Department',
                  ),
                  const Gap(15),
                  DatePickerWidget(
                    errorLabel: 'DOB',
                    hintText: 'Enter DOB',
                    onChanged: (value) {
                      _selectedDob = value;
                    },
                  ),
                  const Gap(15),
                  TextFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        return null;
                      },
                      controller: _email,
                      hintText: 'Enter Email...',
                      keyboard: TextInputType.emailAddress),
                  const Gap(15),
                  PasswordFieldWidget(
                      errorLabel: 'Password',
                      controller: _password,
                      hintText: 'Enter Password...'),
                  const Gap(15),
                  PasswordFieldWidget(
                      errorLabel: 'Confirm Password',
                      controller: _confirmPassword,
                      hintText: 'Re-Enter Password...'),
                  const Gap(15),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return MainButton(
                        isLoading: state is AuthLoadingState,
                        hintText: 'Sign Up',
                        onPressed: _submitForm,
                      );
                    },
                  ),
                  const Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        ),
                        child: Text(
                          'Sign In here',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
