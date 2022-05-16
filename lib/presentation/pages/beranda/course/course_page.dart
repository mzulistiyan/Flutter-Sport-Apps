import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/olahraga/volley/detail_volley_page.dart';

import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_course_applikasi_page.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    Widget volleyWidget() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: AssetImage(
                    'assets/images/image_2.png',
                  ))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GYM',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff0076CB),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xff0076CB),
                        )),
                    child: Center(
                      child: Text(
                        'Countinue  ',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff0076CB),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '4 / 7',
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Your Progres',
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget videoTutorial() {
      return Container(
        child: Row(
          children: [
            Container(
              child: Image.asset(
                'assets/image_video_tutorial.png',
                width: 170,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VOLLEY',
                  style: GoogleFonts.montserrat(
                    color: const Color(0xff0076CB),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const DetailCourseApplikasiPage());
                  },
                  child: Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xff0076CB),
                        )),
                    child: Center(
                      child: Text(
                        'Start',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xff0076CB),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Good and true\nhomeworkot\n',
                      style: GoogleFonts.montserrat(
                          color: Colors.blue, fontSize: 12)),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xff0173C8),
        ),
        centerTitle: true,
        title: Text(
          'Course',
          style: GoogleFonts.montserrat(
            color: const Color(0xff0076CB),
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          volleyWidget(),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Video Tutorial',
              style: GoogleFonts.montserrat(
                color: Colors.blue,
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          videoTutorial(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: 80,
        height: 80,
        child: Center(
          child: Image.asset(
            'assets/icon_sport_2.png',
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
