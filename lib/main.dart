import 'package:flutter/material.dart';
import 'pages/home_page.dart';


void main() {
  runApp(const PersonalGalleryApp());
}

class PersonalGalleryApp extends StatelessWidget {
  const PersonalGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}