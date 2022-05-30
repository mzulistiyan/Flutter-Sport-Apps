import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/auth_cubit.dart';
import 'package:flutter_application_sport_apps/cubit/olahraga_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

import 'presentation/pages/splash_screen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => OlahragaCubit(),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: transition.Transition.cupertino,
        home: SplashScreenPage(),
      ),
    );
  }
}
