import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/page_cubit.dart';

import 'package:flutter_application_sport_apps/presentation/pages/beranda/course/course_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/home_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/mailbox/mailbox_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/onprogres/onprogres_page.dart';
import 'package:flutter_application_sport_apps/presentation/widget/custom_nav_bottom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return CoursePage();
          break;
        case 2:
          return MailBoxPage();
          break;
        case 3:
          return OnProgresPage();
          break;

        default:
          return HomePage();
      }
    }

    Widget CustomButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin:
              const EdgeInsets.only(bottom: 0, left: 12, right: 12, top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNav(
                index: 0,
                imageUrl: 'assets/icon_beranda.png',
                desc: 'Beranda',
              ),
              CustomBottomNav(
                index: 1,
                imageUrl: 'assets/icon_vector.png',
                desc: 'Course',
              ),
              CustomBottomNav(
                index: 2,
                imageUrl: 'assets/icon_email.png',
                desc: 'Mail Box',
              ),
              CustomBottomNav(
                index: 3,
                imageUrl: 'assets/icon_progres.png',
                desc: 'Progres',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              buildContent(currentIndex),
              CustomButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
