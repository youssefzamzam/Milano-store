import 'package:flutter/material.dart';
import 'package:project1/home/main_screen.dart';
import 'package:project1/home/about_screen.dart';
import 'package:project1/home/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List screens = [
    const ProfileScreen(),
    const MainScreen(),
    const AboutScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Milano Store",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person),
              label: "Profile"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: "home"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info),
              label: "About"
          )
        ],
      ),
    );
  }
}
