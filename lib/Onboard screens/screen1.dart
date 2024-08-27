import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img4.png"),
        const SizedBox(height: 40,),
        const Text(
          "Purchase Online !!",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 20,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "You will find everything here ",
            style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
