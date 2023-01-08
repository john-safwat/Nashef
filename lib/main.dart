import 'package:flutter/material.dart';
import 'package:theoryofmetalforming/calcscreen.dart';
import 'package:theoryofmetalforming/graph.dart';
import 'package:theoryofmetalforming/home_screen.dart';
import 'package:theoryofmetalforming/presentationscreen.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        DerivationScreen.routeName :(_) => DerivationScreen(),
        CalcScreen.routeName :(_) => CalcScreen(),
        Graph.routeName :(_) => Graph(),
      },
      initialRoute: HomeScreen.routeName ,
    );
  }
}
