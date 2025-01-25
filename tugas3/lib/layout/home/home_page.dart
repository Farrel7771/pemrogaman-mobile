import 'package:flutter/material.dart';
import 'package:tugas3/layout/home/news_page.dart';

class Mulai extends StatefulWidget {
  @override
  MulaiState createState() => MulaiState();
}

class MulaiState extends State<Mulai> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Newspage(), // Halaman berita
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        title: Text(
          ' BELAJAR AJA ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
     body: _tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.redAccent,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post Data',
          ),
         ],
      ),
    );
  }
}