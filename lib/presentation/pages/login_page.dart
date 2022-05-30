import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/auth_cubit.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/home_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/registrasi_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return const Color(0xff0076CB);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icon-sport-apps.png',
                  width: 50,
                ),
                Text(
                  "LET'S GO",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: const Color(0xff0076CB),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xff0076CB)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff0076CB),
                            fontSize: 24,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Get.off(HomePage());
                    } else if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff0076CB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().signIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        },
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: const Color(0xff0076CB),
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'I have read and agree to SPORT Privacy Police and Terms of Use',
                      style: GoogleFonts.poppins(
                          color: Color(0xff0076CB),
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff0076CB),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/google-icon.png',
                          width: 30,
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xff0076CB),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/facebook-icon.png',
                          width: 30,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account ?",
                      style: GoogleFonts.poppins(
                          color: Color(0xff0076CB),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegistrasiPage());
                      },
                      child: Text(
                        'Sign Up Now',
                        style: GoogleFonts.poppins(
                            color: Color(0xff0076CB),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
