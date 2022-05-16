import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({Key? key}) : super(key: key);

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
          'Evaluation',
          style: GoogleFonts.montserrat(
            color: const Color(0xff0076CB),
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Dear, Amalia',
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 3,
              height: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/image_gym_evaluation.png',
              width: 450,
              height: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'GYM',
                style: GoogleFonts.montserrat(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                  ),
                  text:
                      'Selamat, target olahraga kamu telah tercapai inilah data kamu setelah kamu menyelesaikan olahraga nya '),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Waktu Olahraga : 7 Days\nWaktu Mulai Olahraga : 13 April 2020 \nkalori Terbakar : 1500 Kalori\nTarget : 21  Gerakan senam',
              style: GoogleFonts.montserrat(
                color: Colors.blue,
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
