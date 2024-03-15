import 'package:flutter/material.dart';
import '../ui/pages/home_page.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Etanol x Gasolina',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
