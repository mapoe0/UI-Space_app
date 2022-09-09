import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/color.dart';
import 'dart:math' as math;

import 'package:space_app/views/constellation_view.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.index, required this.newsTxt});
  int index;
  String newsTxt;
  double cardWidth = 250;
  double cardHeight = 266;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/news_$index.jpg'),
            fit: BoxFit.cover),
      ),
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Flexible(
              child: Text(newsTxt,
                  style: GoogleFonts.roboto(fontSize: 18, color: lightGrey))),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConstellationView()));
              },
              icon: Transform.rotate(
                  angle: math.pi,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: lightGrey,
                  )))
        ],
      ),
    );
  }
}
