import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/olahraga_cubit.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/course/course_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/mailbox/mailbox_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/menu/logout_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/menu/profile_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/menu/setting_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/olahraga/crud/create_olahraga_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/olahraga/gym/gym_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/olahraga/running/running_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/onprogres/onprogres_page.dart';

import 'package:flutter_application_sport_apps/presentation/pages/beranda/search_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/time_line_page.dart';
import 'package:flutter_application_sport_apps/presentation/widget/olahraga_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'olahraga/volley/volley_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    // TODO: implement initState
    context.read<OlahragaCubit>().fetchFod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget olahragaModel(List<OlahragaModel> olahraga) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: olahraga.map((OlahragaModel olahraga) {
                return OlahragaCard(olahraga);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icon-sport-apps.png',
                      width: 40,
                    ),
                    Text(
                      'SPORT',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff0076CB),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return _showDialogMenu();
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/icon-menu.png',
                    width: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 145,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/home-page.png'))),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.to(const SearchPage()),
                  child: Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xff0076CB),
                        width: 2,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xff0076CB),
                                      width: 2)),
                              child: const Center(
                                child: Icon(Icons.search,
                                    size: 15, color: const Color(0xff0076CB)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 2,
                              height: 20,
                              color: const Color(0xff0076CB),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'PENCARIAN',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff0076CB),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xff0076CB),
                      width: 2,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.to(TimeLinePage()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          'TIMELINE',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return _showDialogMenuJenisOlahraga();
                            },
                          ),
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Jenis',
                              style: GoogleFonts.montserrat(
                                  fontSize: 8, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Olahraga',
                              style: GoogleFonts.montserrat(
                                  fontSize: 8, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      GestureDetector(
                        onTap: () => {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return _showDialogMenuJenisOlahraga();
                            },
                          ),
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xff0076CB),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icon-menu-2.png',
                              width: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recomended For Begineer',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: const Color(0xff0076CB),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(UploadingImageToFirebaseStorage()),
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xff0076CB),
                              width: 2,
                            )),
                        child: const Icon(
                          Icons.more_horiz,
                          size: 15,
                          color: Color(0xff0076CB),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                  color: Color(0xff0076CB),
                  height: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                BlocConsumer<OlahragaCubit, OlahragaState>(
                  listener: (context, state) {
                    if (state is OlahragaFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is OlahragaSuccess) {
                      return olahragaModel(state.olahragas);
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recomended For Begineer',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: const Color(0xff0076CB),
                      ),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff0076CB),
                            width: 2,
                          )),
                      child: const Icon(
                        Icons.more_horiz,
                        size: 15,
                        color: Color(0xff0076CB),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                  color: Color(0xff0076CB),
                  height: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(OnProgresPage());
                        },
                        child: Image.asset(
                          'assets/images/image_1.png',
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => Get.to(CoursePage()),
                        child: Image.asset(
                          'assets/images/image_2.png',
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => Get.to(MailBoxPage()),
                        child: Image.asset(
                          'assets/images/image_3.png',
                          width: 100,
                          height: 150,
                        ),
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        'assets/images/image_4.png',
                        width: 100,
                        height: 150,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _showDialogMenu() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/background_show_dialog.png',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
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
              SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const ProfilePage()),
                    child: Image.asset(
                      'assets/icon_person.png',
                      width: 35,
                      height: 35,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Profile',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/icon_calendar.png',
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Calendar',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(const SettingPage()),
                    child: const Icon(
                      Icons.settings,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Setting',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(const LogoutPage()),
                    child: const Icon(
                      Icons.power_settings_new_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Log Out',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/icon_evaluation.png',
                    width: 35,
                    height: 35,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Evaluation',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    'assets/icon_sport.png',
                    width: 50,
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showDialogMenuJenisOlahraga() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/background_show_dialog.png',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Jenis Olahraga',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/icon_arrow_back.png',
                      width: 30,
                      height: 30,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 180,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const VolleyPage());
                    },
                    child: Text(
                      'Volley',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(const GymPage()),
                    child: Text(
                      'Gym',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(RunningPage()),
                    child: Text(
                      'Run',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  Image.asset(
                    'assets/icon_sport.png',
                    width: 50,
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
