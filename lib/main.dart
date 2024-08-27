import 'package:flutter/material.dart';
import 'package:project1/Onboard%20screens/screen1.dart';
import 'package:project1/Onboard%20screens/screen2.dart';
import 'package:project1/Onboard%20screens/screen3.dart';


import 'package:project1/login/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shop app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  String buttonText = "Skip";
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            currentPageIndex = index;
            if (index == 2) {
              buttonText = "Finish";
            } else {
              buttonText = "Skip";
            }
            setState(() {});
          },
          children: const [Screen1(), Screen2(), Screen3()],
        ),
        Container(
          alignment: const Alignment(0, 0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                   MaterialPageRoute(
                  builder: (context) => const RegisterScreen()));
                },
                child: Text(buttonText),
              ),
              SmoothPageIndicator(
                  controller: pageController,
                  count: 3
              ),
              currentPageIndex == 2 ? const SizedBox(width: 10,) : GestureDetector(
                      onTap: () {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: const Text("Next"),
                    )
            ],
          ),
        )
      ],
    ));
  }
}
