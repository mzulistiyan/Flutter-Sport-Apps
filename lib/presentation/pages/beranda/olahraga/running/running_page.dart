import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_running_page.dart';

class RunningPage extends StatefulWidget {
  const RunningPage({Key? key}) : super(key: key);

  @override
  State<RunningPage> createState() => _RunningPageState();
}

class _RunningPageState extends State<RunningPage> {
  @override
  Widget build(BuildContext context) {
    Widget volleyWidget() {
      return Container(
        child: Row(
          children: [
            Container(
              width: 150,
              height: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                      image: AssetImage(
                    'assets/image_running.png',
                  ))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RUNNING',
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
                  onTap: () => Get.to(DetailRunningPage()),
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
                RichText(
                  text: TextSpan(
                      text:
                          'Business & Lifestyle,\nCatalogs, Kompas, Garden\nKontan, Koran Sindo, Media\nIndonesia, Men, Teen & Kids',
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
          'RUNNING',
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
