import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/auth_cubit.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/home_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/login_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/main_page.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.to(const LoginPage());
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Get.off(MainPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon-sport-apps.png',
              width: 100,
            ),
            Text("LET'S GO",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: const Color(0xff0076CB))),
          ],
        ),
      ),
    );
  }
}
