import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/course_cubit.dart';
import 'package:flutter_application_sport_apps/cubit/olahraga_cubit.dart';
import 'package:flutter_application_sport_apps/models/course_model.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:flutter_application_sport_apps/presentation/pages/main_page.dart';
import 'package:flutter_application_sport_apps/services/firebase_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../home_page.dart';
import '../../screen.dart';

class CreateCoursePage extends StatefulWidget {
  @override
  _CreateCoursePageState createState() => _CreateCoursePageState();
}

class _CreateCoursePageState extends State<CreateCoursePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController detailController = TextEditingController(text: '');
  File? _imageFile;
  UploadTask? task;
  File? file;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    requestPermissions();
    var androidSettings = AndroidInitializationSettings('app_icon');

    var initSetttings = InitializationSettings(
      android: androidSettings,
    );
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onClickNotification);
  }

  void requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future? onClickNotification(String? payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return DestinationScreen(
        payload: payload!,
      );
    }));
  }

  Future<void> showSimpleNotification() async {
    var androidDetails = AndroidNotificationDetails(
      'id',
      'channel ',
      priority: Priority.high,
      importance: Importance.max,
      icon: 'app_icon',
    );
    var iOSDetails = IOSNotificationDetails();
    var platformDetails = new NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'Sport Apps Notification', 'Success Create Course', platformDetails,
        payload: 'Destination Screen (Simple Notification)');
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? (file!.path) : 'No File Selected';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Create Course',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: TextButton(
                  child: Text(
                    'Select File Image Olahraga',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: selectFile,
                ),
              ),
              SizedBox(height: 15),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
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
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      child: Text(
                        'Create',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (file == null) return;

                        final fileName = (file!.path);
                        final destination = 'files/$fileName';

                        task = FirebaseApi.uploadFile(destination, file!);
                        setState(() {});

                        if (task == null) return;

                        final snapshot = await task!.whenComplete(() {});
                        final urlDownload = await snapshot.ref.getDownloadURL();

                        context.read<CourseCubit>().createCourse(CourseModel(
                            name: nameController.text,
                            detail: detailController.text,
                            imageUrl: urlDownload));
                        showSimpleNotification();
                        print('Download-Link: ');
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {}
}
