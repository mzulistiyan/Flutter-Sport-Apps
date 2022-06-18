// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/course_cubit.dart';
import 'package:flutter_application_sport_apps/models/course_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main_page.dart';

class DetailCourseApplikasiPage extends StatefulWidget {
  final CourseModel course;
  const DetailCourseApplikasiPage(this.course, {Key? key}) : super(key: key);

  @override
  State<DetailCourseApplikasiPage> createState() =>
      _DetailCourseApplikasiPageState();
}

class _DetailCourseApplikasiPageState extends State<DetailCourseApplikasiPage> {
  bool? check = false;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController detailController = TextEditingController(text: '');
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'COURSE ${widget.course.name}',
              style: GoogleFonts.montserrat(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
                decorationColor: Colors.blue,
              ),
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return _showDialogUpdate();
                        },
                      );
                    },
                    child: Icon(Icons.edit)),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Please Confirm',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Are you sure want to continue?'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      BlocConsumer<CourseCubit, CourseState>(
                                        listener: (context, state) {
                                          if (state is CourseSuccess) {
                                            Get.to(MainPage());
                                          } else if (state is CourseFailed) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(state.error),
                                              ),
                                            );
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is CourseLoading) {
                                            return Container(
                                              alignment: Alignment.center,
                                              margin: const EdgeInsets.only(
                                                  top: 30),
                                              child:
                                                  const CircularProgressIndicator(),
                                            );
                                          }

                                          return TextButton(
                                            onPressed: () {
                                              context
                                                  .read<CourseCubit>()
                                                  .deleteCourse(
                                                    widget.course.id.toString(),
                                                  );
                                            },
                                            child: Text(
                                              'Delete',
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 14,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(Icons.delete)),
              ],
            )
          ],
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

  Widget _showDialogUpdate() {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 50),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            height: 250,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nama Course',
                    filled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: detailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Detail Course',
                    filled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                BlocConsumer<CourseCubit, CourseState>(
                  listener: (context, state) {
                    if (state is CourseSuccess) {
                      Get.to(MainPage());
                    } else if (state is CourseFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is CourseLoading) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 30),
                        child: const CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.blue,
                          )),
                      child: TextButton(
                        child: Text('Update Data'),
                        onPressed: () {
                          context.read<CourseCubit>().updateCourse(
                              widget.course.id.toString(),
                              CourseModel(
                                name: nameController.text,
                                detail: detailController.text,
                              ));
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
