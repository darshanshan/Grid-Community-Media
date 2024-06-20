import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:grid/features/authentication/bloc/auth_bloc.dart';
import 'package:grid/features/home/presentation/home_feed_screen.dart';
import 'package:grid/core/widgets/button/main_button.dart';
import 'package:grid/core/widgets/form_elements/password_field.dart';
import 'package:grid/features/authentication/presentation/register_screen/register_page.dart';
import 'package:grid/core/widgets/form_elements/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.successsMessage)));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeFeed()),
                (Route<dynamic> route) => false);
          }
          if (state is AuthLoginErroState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Invalid Credentials')));
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Grid',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                    margin: const EdgeInsets.fromLTRB(10, 60, 10, 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.secondary,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(58, 0, 0, 0),
                            blurRadius: 8,
                          ),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Get Started',
                            style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(
                          height: 25,
                        ),
                        Text('Enter your Login credentials',
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                            height: 50,
                            child: TextFieldWidget(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                return null;
                              },
                              controller: email,
                              hintText: 'Enter Email...',
                              keyboard: TextInputType.emailAddress,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 50,
                            child: PasswordFieldWidget(
                              errorLabel: 'Password',
                              controller: password,
                              hintText: 'Enter Password...',
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Forget Password ?',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontSize: 14,
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return MainButton(
                              isLoading: state is AuthLoadingState,
                              hintText: 'Sign In',
                              onPressed: () {
                                context.read<AuthBloc>().add(AuthLoginEvent(
                                    email: email.text.trim(),
                                    password: password.text.trim()));
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont't have an account? ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  )),
                              child: Text(
                                'Sign Up here',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/Lgo-mob.png',
                    height: 60,
                    fit: BoxFit.cover,
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
