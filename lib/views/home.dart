import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/color.dart';
import 'package:space_app/widgets/news_card.dart';
import 'package:space_app/widgets/planet_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<IconData> iconList = [Icons.home, Icons.person, Icons.abc];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg_1.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
          bottomNavigationBar: _buildBottomNavBar(),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        // welcome title
                        Text(
                          'Welcome !',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 29),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        __buildCelestialBodyMenu(),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildPlanetSection(),
                        const SizedBox(
                          height: 15,
                        ),
                        // NEWs Title
                        Text(
                          'News',
                          style: GoogleFonts.roboto(
                            color: yellow,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildNewsSection()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Container _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, -1))
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        clipBehavior: Clip.none,
        child: CurvedNavigationBar(
          color: const Color.fromRGBO(13, 13, 13, 1),
          backgroundColor: yellow,
          items: const <Widget>[
            ImageIcon(
              AssetImage(
                'assets/icons/home.png',
              ),
              size: 32,
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage(
                'assets/icons/globe.png',
              ),
              size: 32,
              color: Colors.white,
            ),
            ImageIcon(
              AssetImage(
                'assets/icons/user.png',
              ),
              size: 32,
              color: Colors.white,
            )
          ],
          onTap: (index) {
            //Handle button tap
          },
          animationDuration: const Duration(milliseconds: 400),
        ),
      ),
    );
  }

  Widget _buildNewsSection() {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(
            width: 5,
          ),
          NewsCard(
              index: 1,
              newsTxt:
                  'Mapping the Sky: Finding asteroids requires a combination of tools.'),
          const SizedBox(
            width: 50,
          ),
          NewsCard(
              index: 2,
              newsTxt:
                  'Impulse and Relativity announce proposal for joint Mars landing mission'),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildPlanetSection() {
    return SizedBox(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(
            width: 5,
          ),
          PlanetCard(
            planetTitle: 'Earth',
            index: 1,
          ),
          const SizedBox(
            width: 50,
          ),
          PlanetCard(
            planetTitle: 'Mars',
            index: 2,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Widget __buildCelestialBodyMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              'All',
              style: GoogleFonts.roboto(
                color: yellow,
                fontSize: 18,
              ),
            ),
            Container(
              color: yellow,
              width: 30,
              height: 2,
            )
          ],
        ),
        Text(
          'Planets',
          style: GoogleFonts.roboto(color: lightGrey, fontSize: 18),
        ),
        Text('Stars',
            style: GoogleFonts.roboto(color: lightGrey, fontSize: 18)),
        Text('Comets',
            style: GoogleFonts.roboto(color: lightGrey, fontSize: 18))
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/icons/menu.png',
          color: Colors.white.withOpacity(0.8),
          width: 28,
          height: 28,
        ),
        Icon(
          Icons.search,
          color: Colors.white.withOpacity(0.8),
          size: 28,
        )
      ],
    );
  }
}
