import 'package:flutter/material.dart';
import 'package:mybeautybooking_flutter/screens/home_screen.dart';
import 'package:mybeautybooking_flutter/screens/login_screen.dart';
import 'package:mybeautybooking_flutter/screens/signup_screen.dart';
import 'package:mybeautybooking_flutter/screens/tess_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'My Beauty Booking',
      debugShowCheckedModeBanner: false,
      
      // Initial screen
      initialRoute: '/tess',

      // Named routes
      routes: {
        '/tess': (context) => const TessHomescreen(),
        '/login': (context) => const BeautyLoginPage(),
        '/signup': (context) => const BeautySignUpPage(),
        '/home': (context) => const HomeScreen(), // Placeholder for home screen
      },
 );
    }}