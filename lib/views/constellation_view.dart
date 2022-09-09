import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/color.dart';

class ConstellationView extends StatelessWidget {
  const ConstellationView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_2.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                  top: 5,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 24,
                              color: lightGrey,
                            )),
                        Icon(
                          Icons.info_outline,
                          color: lightGrey,
                          size: 24,
                        )
                      ],
                    ),
                  )),
              Positioned(
                  top: screenHeight * 0.5,
                  left: screenWidth * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: yellow,
                              boxShadow: [
                                BoxShadow(
                                    color: yellow.withOpacity(0.5),
                                    spreadRadius: 7,
                                    blurRadius: 0)
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildBuble(),
                    ],
                  )),
              Positioned(
                  top: screenHeight * 0.8,
                  left: screenWidth / 2 - 65,
                  child: _realitySwitcher()),
              Positioned(
                  top: 0, child: Image.asset('assets/constellation.png')),
            ],
          )),
    );
  }

  Widget _buildBuble() {
    double width = 170;
    double height = 60;
    double square = 30;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: -square / 2,
            left: width / 2 - square / 2,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: square,
                width: square,
                decoration: BoxDecoration(
                    color: yellow,
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(10))),
              ),
            )),
        Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: yellow,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Text(
            'Sagittarius Constellation Zodiac',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _realitySwitcher() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Colors.white.withOpacity(0.4)),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Text(
            'Object',
            style:
                GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            'AR',
            style: GoogleFonts.roboto(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        )
      ]),
    );
  }
}
