import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:grid/features/authentication/bloc/auth_bloc.dart';
import 'package:grid/features/authentication/presentation/register_screen/professor_register.dart';

import 'package:grid/features/authentication/presentation/register_screen/student_register.dart';
import 'package:grid/features/home/presentation/home_feed_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isStudent = true;
  Widget _cardContainer({
    required Color color,
    required String user,
    required BorderRadiusGeometry border,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isStudent = !isStudent;
        });
      },
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: border,
          border: Border.all(
            width: 1,
            color: Colors.transparent,
          ),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 1),
          child: Text(
            user,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }

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
              (Route<dynamic> route) => false,
            );
          }
          if (state is InformationMisMatchState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Information Mismatch')));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Grid',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const Gap(20),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _cardContainer(
                                    color: isStudent
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onTertiary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                    user: 'Student',
                                    border: const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16)),
                                  ),
                                  Container(
                                    width: 2,
                                    height: double.infinity,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                  _cardContainer(
                                    color: !isStudent
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onTertiary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                    user: 'Professor',
                                    border: const BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      isStudent
                          ? const StudentRegister()
                          : const ProfessorRegister(),
                      const Gap(20),
                      Image.asset(
                        'assets/images/Lgo-mob.png',
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
