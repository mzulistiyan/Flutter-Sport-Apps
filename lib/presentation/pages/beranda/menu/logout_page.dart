import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/auth_cubit.dart';
import 'package:flutter_application_sport_apps/cubit/olahraga_cubit.dart';
import 'package:flutter_application_sport_apps/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/background_show_dialog.png',
          ),
        ),
      ),
      child: Container(
          padding: const EdgeInsets.fromLTRB(34, 80, 24, 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/icon_alert.png',
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        'Logout',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: const Color(0xff0076CB),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Are you sure you will complete\nsports activities ?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff0076CB),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 125,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xffEA4335),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'NO',
                                style: GoogleFonts.montserrat(
                                    color: const Color(0xffEA4335)),
                              ),
                            ),
                          ),
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(state.error),
                                  ),
                                );
                              } else if (state is AuthInitial) {
                                Get.off(LoginPage());
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return GestureDetector(
                                onTap: () =>
                                    context.read<AuthCubit>().signOut(),
                                child: Container(
                                  width: 125,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color(0xff0076CB),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'YES',
                                      style: GoogleFonts.montserrat(
                                          color: const Color(0xff0076CB)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
