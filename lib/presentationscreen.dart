import 'package:flutter/material.dart';

class DerivationScreen extends StatelessWidget {
  static const String routeName = 'datashowscreen';
  double MU = 0;
  double Y = 0;
  double H0 = 0;
  double HF = 0;
  double BL = 0;
  double Bw = 0;
  double b = 0;
  double no_points = 0;

  List<String> lubricationCasesList = ['It is Pure lubricant case' , 'It is Pure sticking case' , 'It is mixed case'];
  int MUp =0  ;
  int k = 0;
  int T =0;
  int Xtransition = 0;
  double Pmax = 0 ;
  double Pavg = 0 ;
  bool x = true;
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
              child: x ? Row(
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
              ) : Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        height: 120,
                        child: ElevatedButton(
                          onPressed: (){
                            ShowModalButtomSheet(context,
                             '''
                                Apply Equilibrium equation on selected element:
                                On right of center line
                                (q+dq)h-qh+2μPdx=0
                                On left of center line
                                (q+dq)h-qh-2μPdx=0
                                Therefore we can write the equation as follows
                                ${equilibrium}
                                Yield criteria
                                q is one of the principle stress and p is the other,they are 
                                related by plain strain condition 
                                ${yield_criteria}
                                Y is yield stress of material in uniaxial tension or compression
                                Tresca Yielding criterion states K=Y/2  
                                where K is yield shear stress of material
                                dq=dp
                            ''', mediaquery);
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
                            ShowModalButtomSheet(context,
                             '''
                                hdq±2μPdx=0 (1)
                                dq=dp
                                substitute yield critera in equilibrium ${yield_criteria} ${equilibrium}:
                                ${elementary_assessment}
                                ${integration_elementary_assessment}:
                                ${lubricant}
                                C_sticking = ${lubricant} (P=Y=2K at x=±b/2)
                                C_(-b/2)=2K e^(2μ/h*b/2)
                                C_(+b/2)=2K e^(2μ/h*b/2)
                                We deduce that the constant is same on left or right side of center line
                                P/2k=e^(2μ/h(b/2-x))
                            ''', mediaquery);
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
                            ShowModalButtomSheet(context,
                             '''
                                Friction conditions
                                At friciton conditions,Shear yield stength cannot exceed K
                                Substitution in ${elementary_assessment} yields 
                                ${sticking_cond}
                                Integrated direvtly gives:
                                ${sticking_integration}
                                C_sticking = ${sticking_integration} q=0 ,P=Y=2K at x=±b/2
                                C_(-b/2)=1+b/2h
                                P/2K=1+1/h(b/2-x)
                            ''', mediaquery);
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
                            ShowModalButtomSheet(context,
                            '''
                              Mixed case where P reaches K threfore central region is sticking.
                              hdp±2Tdx=0
                              ${ MUp<k? T=MUp :T=k }
                              Trasnition point is found at μp=k ,
                              (P/2k=1/2μ)
                              Xtransition=b/2-h/2μ  ln⁡〖1/2μ〗
                              From x_1 inward,pressure is governed by sticking fricition
                              ${Sticking_central(0 ,Xtransition)}
                              ${lubricant_after(Xtransition ,b/2 )}
                            ''', mediaquery);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xff043353)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                          child: Text('Elementary assessment' , textAlign: TextAlign.center,),
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

  void equilibrium(){}
  void yield_criteria(){}
  void elementary_assessment(){}
  void integration_elementary_assessment(){}
  void lubricant(){}
  void sticking_cond(){}
  void sticking_integration(){}
  int Sticking_central(int c,int y){return -1 ;}
  int lubricant_after(int c,double y){return -1 ;}
}
