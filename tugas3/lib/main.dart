import 'package:flutter/material.dart';
import 'package:tugas3/layout/home/news_page.dart'; // Tetap digunakan karena akan langsung memuat Newspage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Newspage(), // Langsung memuat Newspage sebagai halaman utama
    );
  }
}
