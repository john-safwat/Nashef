import 'package:flutter/material.dart';
import 'package:theoryofmetalforming/calcscreen.dart';
import 'package:theoryofmetalforming/presentationscreen.dart';

class HomeScreen extends StatelessWidget {
  // the widget route name
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/bgimage.jpg") ,fit:BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 350,
                  width: 300,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white70),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(60)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, DerivationScreen.routeName);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/statistics.png"),
                        Text("Analysis & Derivation" , style: TextStyle(color: Colors.black87),),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  width: 300,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white70),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(60)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, CalcScreen.routeName);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/chalkboard.png"),
                        Text("calculations" , style: TextStyle(color: Colors.black87),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
