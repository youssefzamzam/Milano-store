import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
                'About :',
                    style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
                    ),
                    ),
          ),
        
         Padding(
           padding: EdgeInsets.all(15.0),
           child: Text("We're thrilled to have you here. At Milano Store, our mission is to make every product you want is avaliable",style: TextStyle(fontSize: 15),),
         ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(" our app is designed with you in mind. With intuitive features and a user-friendly interface, we aim to  help you achieve your goals effortlessly.",style: TextStyle(fontSize: 15)),
        ),
      SizedBox(height: 20,),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Thank you for choosing Milano Store. We’re committed to providing you with a top-notch experience, and we’re always here to help. Explore, enjoy, and let us know how we can make your journey even better!",style: TextStyle(fontSize: 15)),
      ),
        SizedBox(height: 20,),
        Text("Warm regards, The Milano Team",style: TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}