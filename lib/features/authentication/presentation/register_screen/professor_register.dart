import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grid/core/widgets/form_elements/date_picker.dart';
import 'package:grid/features/authentication/presentation/login_screen/login.dart';
import 'package:grid/core/widgets/button/main_button.dart';
import 'package:grid/core/widgets/form_elements/password_field.dart';
import 'package:grid/core/widgets/form_elements/textfield.dart';

class ProfessorRegister extends StatefulWidget {
  const ProfessorRegister({super.key});

  @override
  State<ProfessorRegister> createState() => _ProfessorRegisterState();
}

class _ProfessorRegisterState extends State<ProfessorRegister> {
  final TextEditingController _regNoProf = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text('Setup Profile',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Register number cannot be empty';
                    }
                    return null;
                  },
                  controller: _regNoProf,
                  hintText: 'Enter Register No...',
                  keyboard: TextInputType.text),
              const Gap(15),
              DatePickerWidget(
                errorLabel: 'DOB',
                hintText: 'Enter DOB',
                onChanged: () {},
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
              MainButton(
                isLoading: false,
                hintText: 'Sign Up',
                onPressed: () {},
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
                          color: Theme.of(context).colorScheme.primaryContainer,
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
    );
  }
}
