import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/olahraga_cubit.dart';
import 'package:flutter_application_sport_apps/cubit/page_cubit.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/screen.dart';
import 'package:flutter_application_sport_apps/presentation/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home_page.dart';

class UpdateOlahragaPage extends StatefulWidget {
  final OlahragaModel olahraga;
  UpdateOlahragaPage(this.olahraga, {Key? key}) : super(key: key);

  @override
  State<UpdateOlahragaPage> createState() => _UpdateOlahragaPageState();
}

class _UpdateOlahragaPageState extends State<UpdateOlahragaPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController detailController = TextEditingController(text: '');
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
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

  Future<void> showSimpleNotificationUpdate() async {
    var androidDetails = AndroidNotificationDetails(
      'id',
      'channel ',
      priority: Priority.high,
      importance: Importance.max,
      icon: 'app_icon',
    );
    var iOSDetails = IOSNotificationDetails();
    var platformDetails = new NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(0, 'Sport Apps Notification',
        'Success Update Olahraga', platformDetails,
        payload: 'Destination Screen (Simple Notification)');
  }

  Future<void> showSimpleNotificationDelete() async {
    var androidDetails = AndroidNotificationDetails(
      'id',
      'channel ',
      priority: Priority.high,
      importance: Importance.max,
      icon: 'app_icon',
    );
    var iOSDetails = IOSNotificationDetails();
    var platformDetails = new NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(0, 'Sport Apps Notification',
        'Success Delete Olahraga', platformDetails,
        payload: 'Destination Screen (Simple Notification)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Detail Olahraga ${widget.olahraga.name}',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              widget.olahraga.imageUrl.toString(),
              width: 100,
              height: 150,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                child: Center(
                  child: Text(
                    'Name Olahraga',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Text(' : '),
              Container(
                width: 150,
                child: Center(
                  child: Text(
                    widget.olahraga.name,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                child: Center(
                  child: Text(
                    'Detail Olahraga',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Text(' : '),
              Container(
                width: 150,
                child: Center(
                  child: Text(
                    widget.olahraga.detail,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.blue,
                    )),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return _showDialogUpdate();
                      },
                    );
                  },
                  child: Text(
                    'Update Data',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              BlocConsumer<OlahragaCubit, OlahragaState>(
                listener: (context, state) {
                  if (state is OlahragaSuccess) {
                    Get.to(MainPage());
                  } else if (state is OlahragaFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is OlahragaLoading) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30),
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                          BlocConsumer<OlahragaCubit,
                                              OlahragaState>(
                                            listener: (context, state) {
                                              if (state is OlahragaSuccess) {
                                                Get.to(MainPage());
                                              } else if (state
                                                  is OlahragaFailed) {
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
                                              if (state is OlahragaLoading) {
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
                                                      .read<OlahragaCubit>()
                                                      .deleteOlahraga(
                                                        widget.olahraga.id
                                                            .toString(),
                                                      );
                                                  showSimpleNotificationDelete();
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
                        child: Text(
                          'Delete Data',
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      )),
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
                    hintText: 'Nama Olahraga',
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
                    hintText: 'Detail Olahraga',
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
                BlocConsumer<OlahragaCubit, OlahragaState>(
                  listener: (context, state) {
                    if (state is OlahragaSuccess) {
                      Get.to(MainPage());
                    } else if (state is OlahragaFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is OlahragaLoading) {
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
                          context.read<OlahragaCubit>().updateUserAccept(
                              widget.olahraga.id.toString(),
                              OlahragaModel(
                                name: nameController.text,
                                detail: detailController.text,
                              ));
                          showSimpleNotificationUpdate();
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
