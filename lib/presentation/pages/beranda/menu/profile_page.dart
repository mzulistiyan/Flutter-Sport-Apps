import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                  color: const Color(0xff0076CB),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 120.0)),
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
                    Image.asset(
                      'assets/icon_pencil.png',
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24, 150, 24, 24),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Profile Account',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 30,
                              ),
                            ),
                            Text(
                              'Jakarta, Indonesia',
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff0076CB)),
                            ),
                            Text(
                              'Amalia Putri Amara',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff0076CB),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(24, 380, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Birthday',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff0076CB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 3,
                      height: 1,
                      color: Color(0xff0076CB),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                            fontWeight: FontWeight.w400),
                        text: '28 JUNE 1999',
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Interest',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff0076CB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 3,
                      height: 1,
                      color: Color(0xff0076CB),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                            fontWeight: FontWeight.w400),
                        text:
                            '2Business & Lifestyle, Catalogs, Kompas, Garden, Kontan, Koran Sindo, Media Indonesia, Men, Teen & Kids',
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff0076CB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 3,
                      height: 1,
                      color: Color(0xff0076CB),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                            fontWeight: FontWeight.w400),
                        text: 'Amalia.Putri@Gmail.com',
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Social Media',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff0076CB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 3,
                      height: 1,
                      color: Color(0xff0076CB),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                            fontWeight: FontWeight.w400),
                        text: 'Instagram : Amalia_P.A',
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Profession',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xff0076CB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 3,
                      height: 1,
                      color: Color(0xff0076CB),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                            fontWeight: FontWeight.w400),
                        text: 'Model, Manager.',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/icon_sport_2.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
