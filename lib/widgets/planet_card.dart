import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/color.dart';
import 'dart:math' as math;

import 'package:space_app/views/planet_detail.dart';

// ignore: must_be_immutable
class PlanetCard extends StatelessWidget {
  PlanetCard({super.key, required this.index, required this.planetTitle});
  int index;
  String planetTitle;
  double cardWidth = 206;
  double cardHeight = 266;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('assets/planet_${index}_bg.jpg'),
            fit: BoxFit.cover),
      ),
      child: Stack(children: [
        Positioned(
            top: 15,
            left: 0,
            child: SizedBox(
              width: cardWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        planetTitle,
                        style:
                            GoogleFonts.roboto(color: lightGrey, fontSize: 24),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PlanetDetails()));
                          },
                          icon: Transform.rotate(
                              angle: math.pi,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: lightGrey,
                              ))),
                    ]),
              ),
            )),
        Positioned(
          top: cardHeight / 3,
          left: cardWidth / 3,
          child: Image.asset(
            'assets/planet_$index.png',
            width: 216,
            height: 216,
          ),
        )
      ]),
    );
  }
}
