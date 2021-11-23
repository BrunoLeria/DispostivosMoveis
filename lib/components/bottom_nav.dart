import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.graduationCap,
              size: 20,
            ),
            label: 'Topics'),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bolt,
              size: 20,
            ),
            label: 'about'),
        BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userCircle,
              size: 20,
            ),
            label: 'profile')
      ].toList(),
      fixedColor: Colors.amber,
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // do nothingNNNNNN
            break;
          case 1:
            Navigator.pushNamed(context, '/about');
            break;
          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
