import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              color: const Color(0xff0076CB),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 125.9)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 150, 24, 24),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Setting',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 250,
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xff0076CB)),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notifikasi',
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff0076CB),
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.blue,
                                value: isChecked,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Text(
                                'ON / OFF',
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xff0076CB),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'language',
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff0076CB),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 180,
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: const Color(0xff0076CB),
                            )),
                            child: Center(
                              child: Text(
                                'English',
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xff0076CB),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Bantuan',
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff0076CB),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 180,
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: const Color(0xff0076CB),
                            )),
                            child: Center(
                              child: Text(
                                'Open Live Chat',
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xff0076CB),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
