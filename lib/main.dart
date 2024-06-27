import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid/core/auth/auth_changes.dart';

import 'package:grid/core/utils/themes/dark_theme.dart';
import 'package:grid/core/firebase/firebase_options.dart';
import 'package:grid/core/utils/themes/light_theme.dart';
import 'package:grid/features/authentication/bloc/auth_bloc.dart';
import 'package:grid/features/create_posts/create_event/bloc/create_event_bloc.dart';

import 'package:grid/features/home/bloc/home_bloc.dart';
import 'package:grid/features/create_posts/common_post/bloc/common_post_bloc.dart';

import 'package:grid/features/create_posts/text_post/bloc/text_post_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => TextPostBloc(),
        ),
        BlocProvider(
          create: (context) => CommonPostBloc(),
        ),
        BlocProvider(
          create: (context) => CreateEventBloc(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        home: const AuthChanges(),
      ),
    );
  }
}
