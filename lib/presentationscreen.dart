import 'package:flutter/material.dart';

class DerivationScreen extends StatelessWidget {
  static const String routeName = 'datashowscreen';

  @override
  Widget build(BuildContext context) {
    var mediaquery =  MediaQuery.of(context).size;
    return Container(
      decoration:const BoxDecoration(
        //color: Color(0xffD3DDE6),
        image: DecorationImage(image: AssetImage("assets/images/bgimage2.jpg"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:const IconThemeData(
            color: Colors.black87
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: mediaquery.height*0.6,
              child: Center(
                child: Image.asset("assets/images/graph.png"),
              ),
            ),
            Container(
              width: mediaquery.width*0.7,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        child: ElevatedButton(
                          onPressed: (){
                            ShowModalButtomSheet(context,'assets/images/1.png', mediaquery);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff043353)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))

                          ),
                          child: Text('Elementary assessment' , textAlign: TextAlign.center,),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        child: ElevatedButton(
                          onPressed: (){
                            ShowModalButtomSheet(context,'assets/images/2.png', mediaquery);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff043353)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                          child: Text('Yield criteria',textAlign: TextAlign.center,),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        child: ElevatedButton(
                          onPressed: (){
                            ShowModalButtomSheet(context ,'assets/images/3.png', mediaquery);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff043353)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                          child: Text('Lubrication case', textAlign: TextAlign.center,),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        child: ElevatedButton(
                          onPressed: (){
                            ShowModalButtomSheet(context,'assets/images/4.png', mediaquery);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff043353)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                          child: Text('Sticking case', textAlign: TextAlign.center,),
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        child: ElevatedButton(
                          onPressed: (){
                            ShowModalButtomSheet(context,'assets/images/5.png', mediaquery);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff043353)),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                          child: Text('Sticking in central zone', textAlign: TextAlign.center,),
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Future<dynamic> ShowModalButtomSheet(BuildContext context ,String content , Size mq){
    return showModalBottomSheet(
      backgroundColor: Colors.black38,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(40),
        height: mq.height,
        child: Image.asset(content),
      )
    );
  }
}
