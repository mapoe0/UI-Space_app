import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/painters/left_triangle_painter.dart';
import 'package:space_app/painters/right_triangle_painter.dart';

import '../color.dart';

class PlanetDetails extends StatefulWidget {
  const PlanetDetails({super.key});

  @override
  State<PlanetDetails> createState() => _PlanetDetailsState();
}

class _PlanetDetailsState extends State<PlanetDetails> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(screenWidth, screenHeight),
          _buildPlanetInformation(screenWidth, screenHeight)
        ],
      ),
    );
  }

  Widget _buildImageSection(double screenWidth, double screenHeight) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/bg_2.jpg'),
              fit: BoxFit.cover)),
      width: screenWidth,
      height: screenHeight / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: GoogleFonts.roboto(
                      color: yellow, fontSize: 18, fontWeight: FontWeight.w300),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPaint(
                painter: LeftTrianglePainter(),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 60,
                  width: 60,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Image.asset(
                  'assets/moon.png',
                  width: 272,
                  height: 218,
                ),
              ),
              CustomPaint(
                painter: RightTrianglePainter(),
                child: Container(
                  width: 60,
                  height: 60,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlanetInformation(double screenWidth, double screenHeight) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 232, 147, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      width: screenWidth,
      height: screenHeight / 2,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mercury',
            style:
                GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  
                ],
              ),
              Text(
                'Journeys',
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              Text(
                'Photos',
                style: GoogleFonts.roboto(fontSize: 18),
              ),
            ],
          ),
          Text(
            "Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun's planets. It is named after the Roman god Mercurius (Mercury) ...",
            style:
                GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfo('Distance from the Sun', '900 million miles', 'Mass',
                  '5.683E26 kg'),
              _buildInfo('Length of Year', '900 million miles', 'Radius',
                  '900 million miles')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title1, String txt1, String title2, String txt2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          txt1,
          style: GoogleFonts.roboto(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title2,
          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          txt2,
          style: GoogleFonts.roboto(fontSize: 14),
        )
      ],
    );
  }

  Row _buildInformationSection(
      String title1, String txt1, String title2, String txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style:
                  GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              txt1,
              style: GoogleFonts.roboto(fontSize: 14),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title2,
              style:
                  GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              txt2,
              style: GoogleFonts.roboto(fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
