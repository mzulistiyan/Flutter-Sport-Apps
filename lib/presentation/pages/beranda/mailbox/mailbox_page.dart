import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/mailbox/evaluation_page.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/olahraga/gym/gym_kategory_page.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class MailBoxPage extends StatelessWidget {
  const MailBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget volleyWidget() {
      return Container(
        child: Row(
          children: [
            Container(
              width: 170,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: AssetImage(
                    'assets/image_gym_mailbox.png',
                  ))),
            ),
            SizedBox(
              width: 10,
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
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Get.to(const EvaluationPage()),
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
                        'Go',
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
                      text: 'Anda tela baru saja\nmenyelesaikanoelaraga ini ',
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
          'Mail Box',
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
          Center(
            child: Text('Hari Ini',
                style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline)),
          ),
          const SizedBox(
            height: 20,
          ),
          volleyWidget(),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Selasa',
                style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline)),
          ),
          const SizedBox(
            height: 20,
          ),
          volleyWidget(),
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
