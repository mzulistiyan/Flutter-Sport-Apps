import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/models/course_model.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/course/detail_course_applikasi_page.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  const CourseCard(this.course, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Image.network(
              course.imageUrl,
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
                course.name,
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
                  Get.to(DetailCourseApplikasiPage(course));
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
                    text: course.detail,
                    style: GoogleFonts.montserrat(
                        color: Colors.blue, fontSize: 12)),
              )
            ],
          )
        ],
      ),
    );
  }
}
