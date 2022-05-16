import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailRunningPage extends StatefulWidget {
  const DetailRunningPage({Key? key}) : super(key: key);

  @override
  State<DetailRunningPage> createState() => _DetailRunningPageState();
}

class _DetailRunningPageState extends State<DetailRunningPage> {
  bool? check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Color(0xff0173C8),
        ),
        centerTitle: true,
        title: Text(
          'RUNNING',
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
            Container(
              width: double.infinity,
              height: 310,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      'RUTE',
                      style: GoogleFonts.montserrat(
                        color: Colors.blue,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/image_maps.png',
                      width: double.infinity,
                      height: 230,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  check == false ? 'Mulai' : 'Selesai',
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Total Jarak\n300M',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon_weather.png',
                      width: 25,
                      height: 25,
                    ),
                    Text(
                      "24'C",
                      style: GoogleFonts.montserrat(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    check == false ? '10' : '0',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 34,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  Text(
                    'M',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      check == false
                          ? setState(() {
                              check = true;
                            })
                          : Get.back();
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xff0076CB),
                          )),
                      child: Center(
                        child: Text(
                          check == false ? 'Next' : 'Finish',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xff0076CB),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
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
