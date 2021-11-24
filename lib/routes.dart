import 'package:demo/views/about/about.dart';
import 'package:demo/views/home/home.dart';
import 'package:demo/views/login/login.dart';
import 'package:demo/views/profile/profile.dart';
import 'package:demo/views/topics/topics.dart';

var appRoutes = {
  '/': (context) => HomeScreen(),
  '/about': (context) => AboutScreen(),
  '/login': (context) => LoginScreen(),
  '/profile': (context) => ProfileScreen(),
  '/topics': (context) => TopicsScreen(),
};
