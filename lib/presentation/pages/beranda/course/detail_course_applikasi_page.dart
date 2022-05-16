// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCourseApplikasiPage extends StatefulWidget {
  const DetailCourseApplikasiPage({Key? key}) : super(key: key);

  @override
  State<DetailCourseApplikasiPage> createState() =>
      _DetailCourseApplikasiPageState();
}

class _DetailCourseApplikasiPageState extends State<DetailCourseApplikasiPage> {
  bool? check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xff0173C8),
        ),
        centerTitle: true,
        title: Text(
          'COURSE',
          style: GoogleFonts.montserrat(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w400,
            decorationColor: Colors.blue,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image_video_tutorial_2.png',
              width: double.infinity,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'VOLLEY',
              style: GoogleFonts.montserrat(
                  color: Colors.blue,
                  fontSize: 20,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.montserrat(
                          color: Colors.blue, fontSize: 12),
                      text:
                          'Good and true home workout for the desired fitness results. Good and true home workout for the desired fitness results. Good and true home workout for the desired fitness results. Good and true home workout for the desired fitness results. Good and true home workout for the desired fitness results',
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.montserrat(
                          color: Colors.blue, fontSize: 12),
                      text:
                          'do you understand and feel helped from the video above?',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Center(
                          child: Text(
                            'NO',
                            style: GoogleFonts.montserrat(
                              color: Colors.blue,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '/',
                        style: GoogleFonts.montserrat(
                            color: Colors.blue, fontSize: 16),
                      ),
                      Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Center(
                          child: Text(
                            'YES',
                            style: GoogleFonts.montserrat(
                              color: Colors.blue,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: 80,
        height: 60,
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
