import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/login/product_model.dart';
import 'package:project1/login/product_provider.dart';

class ShowProducts extends StatefulWidget {
  ShowProducts({super.key});
  List<Product> productsList = [];
  var loaded = false;

  @override
  State<ShowProducts> createState() => _ShowProductsState();
}

class _ShowProductsState extends State<ShowProducts> {
  products() async {
    var productsList = await productProvider();
    widget.productsList = productsList;
    widget.loaded = true;
    setState(() {
      
    });
   }
  @override
  void initState() {
    products();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: buildStackIcon(thump: "https://st2.depositphotos.com/3818339/10449/v/950/depositphotos_104499442-stock-illustration-vector-makeup-background-glamorous-makeup.jpg"),
        ),
        title: const Text('MakeUp Products'),

      ),
      body: ListView(
        children: [
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
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: !widget.loaded?const Center(child:  CircularProgressIndicator()): ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.productsList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [buildStackIcon(dot: true,thump: widget.productsList[index].thumbnail),
                    const SizedBox(width: 15,),
                     Expanded(
                       child: Column(children: [
                        Text("${widget.productsList[index].title}",
                          style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Text("${widget.productsList[index].description}",
                          overflow: TextOverflow.ellipsis,maxLines: 1,),
                       
                                           ],),
                     ),
                    const Spacer(flex: 1,),
                    Container(height: 5,width: 5,decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(10)))),
                     Text("${widget.productsList[index].price}\$")

                  ]

                );
              },
              separatorBuilder: (context,idx)=>const SizedBox(height: 15,),
            ),
          ),
        ],
      ),
    );
  }

  Stack buildStackIcon({dot = false, required String? thump}) {
    return Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                          CircleAvatar(
                           backgroundImage: NetworkImage(thump!),
                          radius: 30,
                        ),
                        dot == true ? Container(height: 15,width: 15,decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(10)))): const SizedBox(),
                      ]
                    );
  }
}