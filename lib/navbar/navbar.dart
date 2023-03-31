import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interngrow/mentors_section/mentor_home.dart';
import 'package:interngrow/opportunities_section/opportunity_home.dart';
import 'package:interngrow/pages/home.dart';

class NavBarWidget extends StatefulWidget {
  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int _currentIndex = 0;
  final tabs = [Home(), MentorHome(), OpportunityHome()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: BottomNavyBar(
          backgroundColor: Theme.of(context).primaryColor,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                ),
              ),
              activeColor: Colors.amber.shade500,
              inactiveColor: Colors.amber.shade500,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.people_alt),
              title: Text(
                'Mentors',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                ),
              ),
              activeColor: Colors.amber.shade500,
              inactiveColor: Colors.amber.shade500,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.note_add),
              title: Text(
                'Opportunities',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                ),
              ),
              activeColor: Colors.amber.shade500,
              inactiveColor: Colors.amber.shade500,
            ),
          ],
          animationDuration: Duration(milliseconds: 300),
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
