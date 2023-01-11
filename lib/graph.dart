import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:theoryofmetalforming/calcscreen.dart';
class Graph extends StatelessWidget {
  static const String routeName = 'graph test';

  final List<ChartData> chartData = [];

  double MU = 0;
  double Y = 0;
  double H0 = 0;
  double HF = 0;
  double BL = 0;
  double Bw = 0;
  double B = 0;
  double no_points = 0;

  List<String> lubricationCasesList = ['It is Pure lubricant case' , 'It is Pure sticking case' , 'It is mixed case'];

  double Pmax = 0 ;
  double Pavg = 0 ;
  double XTRANSITION = 0 ;

  @override
  Widget build(BuildContext context) {
    attributes data = ModalRoute.of(context)?.settings.arguments as attributes;
    setdata(data);
    CalcPressure();
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("MU = $MU" , style:const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text("Sigma yield = $Y (MPa)" , style: const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text("Initial height = $H0 (mm)" , style:const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text("Final Height = $HF (mm)" , style:const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text("Bite length = $B (mm)" , style:const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text("XTRANSITION = $XTRANSITION (mm)" , style:const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text("Max pressure = $Pmax (MPa)" , style:const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text("Average pressure = $Pavg (MPa)" , style:const TextStyle(fontSize: 24 , fontWeight: FontWeight.w500 , color: Colors.cyan),),
              ],
            ),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child : LineChart(
                  LineChartData(
                      minX: -B/2 ,
                      minY: Y,
                      maxX: B/2 ,
                      maxY: Pmax,
                      lineBarsData: [
                        LineChartBarData(
                            spots: [
                              for(int i =0 ;i<chartData.length ;i++)
                                FlSpot(chartData[i].x, chartData[i].y),
                            ]
                        )
                      ]
                  )
              ),
            ),
          ))
        ],
      ),
    );
  }

  int CaseCheckIndex(){
    if(XTRANSITION<= 0 ){
      return 0 ;
    }
    else if (XTRANSITION >(B /2 )){
      return 1 ;
    }
    else if (XTRANSITION>0 && XTRANSITION< (B/2)){
      return 2;
    }
    print("invalid input");
    return -1;
  }

  void CalcPressure(){
    if (CaseCheckIndex() == 1){
      for (double i = -B/2 ; i<=B/2 ; i = i + (no_points*(B/2))){
        double P = 0;
        if(i<=0){
          P = Y * (1 + (1 / HF) * (B / 2 + i));
        }
        else {
          P = Y * (1 + (1 / HF) * (B / 2 - i));
        }
        chartData.add(ChartData( i,P ));
      }
    }
    else if (CaseCheckIndex() == 0){
      double P = 0;
      for (double i = -B/2 ; i<=B/2 ; i = i + (no_points*(B/2))){
        if(i<=0){
          P = Y * pow(e , (((2*MU) / HF) * ((B / 2) + i)));
        }
        else {
          P = Y * pow(e , (((2*MU) / HF) * ((B / 2) - i)));
        }
        chartData.add(ChartData( i, P ));
      }
    }
    else if (CaseCheckIndex() == 2){
      double P = 0;
      for (double i = -B/2 ; i<=B/2 ; i = i + (no_points*(B/2))){
        if(i<0 && i<-XTRANSITION){
          P = Y * pow(e , (((2*MU) / HF) * ((B / 2) + i)));
        }
        else if(i<0 && i>-XTRANSITION) {
          P = ((Y)*(HF + ((2*MU)*(XTRANSITION+i))))/(2* MU*HF);
        }
        else if(i>0 && i<XTRANSITION){
          P = ((Y)*(HF + ((2*MU)*(XTRANSITION-i))))/(2* MU*HF);
        }
        else {
          P = Y * pow(e , (((2*MU) / HF) * ((B / 2) - i)));
        }
        chartData.add(ChartData( i, P ));
      }
    }
  }

  void setdata(attributes data){
    MU = data.MU ;
    Y = data.Y ;
    H0 = data.H0 ;
    HF = data.HF ;
    BL = data.BL ;
    Bw = data.Bw ;
    B = data.B;
    Pmax = data.Pmax ;
    Pavg = data.Pavg;
    XTRANSITION = data.XTRANSITION;
    no_points = data.no_point;
  }
}


class ChartData {
  double x ;
  double y ;
  ChartData (this.x,this.y);
}