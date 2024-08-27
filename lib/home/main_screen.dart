import 'package:flutter/material.dart';
import 'package:project1/home/show_products.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const Padding(
          padding:  EdgeInsets.all(20.0),
          child:  Text(
            'Home',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Material(
          color: Colors.blue,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowProducts()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: const NetworkImage("https://st2.depositphotos.com/3818339/10449/v/950/depositphotos_104499442-stock-illustration-vector-makeup-background-glamorous-makeup.jpg"),
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 6,),
                      const Text("MakeUp",style: TextStyle(fontSize: 32,color: Colors.white),
                      )
                    ],
                  ),
                
                ),
              ) ,
              const SizedBox(width: 20,),
              Material(
                color: Colors.blue,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: (){},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: const NetworkImage("https://7star.pk/wp-content/uploads/2023/12/maxresdefault.jpg"),
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 6,),
                      const Text("Watches",style: TextStyle(fontSize: 32,color: Colors.white),
                      )
                    ],
                  ),

                ),
              ) ,
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Column(
          children: [ Material(
            color: Colors.blue,
            elevation: 8,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              splashColor: Colors.black26,
              onTap: (){},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Ink.image(
                    image: const NetworkImage("https://images.anandtech.com/doci/10113/XPS17.jpg"),
                    height: 150,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 6,),
                  const Text("laptops",style: TextStyle(fontSize: 32,color: Colors.white),
                  )
                ],
              ),

            ),
          ) ,],
        )
      ],
    );

  }
}