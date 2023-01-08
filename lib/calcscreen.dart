import 'package:equations/equations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'dart:math';

import 'package:theoryofmetalforming/graph.dart';

class CalcScreen extends StatefulWidget {
  static const String routeName = 'red';

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  String Final_height_of_work_piece_vlaue = 'Height Reduction';
  List<S2Choice<String>> Final_height_of_work_piece_List = [
    S2Choice<String>(value: 'RR', title: 'RR'),
    S2Choice<String>(value: 'Final height', title: 'Final height'),
  ];
  String Bite_length_vlaue = 'Billet';
  List<S2Choice<String>> Bite_length_List = [
    S2Choice<String>(value: 'Billet', title: 'Billet'),
    S2Choice<String>(value: 'Cylinder', title: 'Cylinder'),
    S2Choice<String>(value: 'Press bite', title: 'Press bite'),
  ];

  TextEditingController coefficient_of_friction = TextEditingController();
  TextEditingController Yield_strength = TextEditingController();
  TextEditingController Initial_height_of_workpiece = TextEditingController();
  TextEditingController Final_height_of_work_piece = TextEditingController();
  TextEditingController Bite_length = TextEditingController();
  TextEditingController Bite_width = TextEditingController();
  TextEditingController Number_of_Points = TextEditingController();

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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bgimage2.jpg'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black87
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  //coefficient_of_friction
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                    child: TextFormField(
                      controller: coefficient_of_friction,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Invalid Input";
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          try {
                            final text = newValue.text;
                            if (text.isNotEmpty) double.parse(text);
                            return newValue;
                          } catch (e) {}
                          return oldValue;
                        }),],
                      decoration: const InputDecoration(
                        label: Text('Coefficient of Friction ( μ )' , style: TextStyle( fontSize: 24 ),),
                        contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  //Yield_strength
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                    child: TextFormField(
                      controller: Yield_strength,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Invalid Input";
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          try {
                            final text = newValue.text;
                            if (text.isNotEmpty) double.parse(text);
                            return newValue;
                          } catch (e) {}
                          return oldValue;
                        }),],
                      decoration: const InputDecoration(
                        label: Text('Yield strength ( MPa )' , style: TextStyle( fontSize: 24 ),),
                        contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  //Initial_height_of_workpiece
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                    child: TextFormField(
                      controller: Initial_height_of_workpiece,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Invalid Input";
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          try {
                            final text = newValue.text;
                            if (text.isNotEmpty) double.parse(text);
                            return newValue;
                          } catch (e) {}
                          return oldValue;
                        }),],
                      decoration: const InputDecoration(
                        label: Text('Initial height of workpiece ( mm )' , style: TextStyle( fontSize: 24 ),),
                        contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  //Final_height_of_work_piece
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                    child:Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(width: 2 , color: Colors.blueGrey)
                            ),
                            child: SmartSelect<String>.single(
                                selectedValue: Final_height_of_work_piece_vlaue,
                                title: 'Final height of work piece',
                                choiceItems: Final_height_of_work_piece_List,
                                onChange: (state) => setState(() => Final_height_of_work_piece_vlaue = state.value)
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: Final_height_of_work_piece,
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return "Invalid Input";
                              }
                              if(Final_height_of_work_piece_vlaue == "Final height"){}
                              else{
                                double mm = double.parse(value);
                                if (mm>1 || mm <0){
                                  return "Invalid Input";
                                }
                              }
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                            TextInputFormatter.withFunction((oldValue, newValue) {
                              try {
                                final text = newValue.text;
                                if (text.isNotEmpty) double.parse(text);
                                return newValue;
                              } catch (e) {}
                              return oldValue;
                            }),],
                            decoration: const InputDecoration(
                              label: Text(' Final height of work piece ( mm )' , style: TextStyle( fontSize: 24 ),),
                              contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.red),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 3, color: Colors.blue),
                              ),
                            ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  //Bite_length
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                    child:Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(width: 2 , color: Colors.blueGrey)
                            ),
                            child: SmartSelect<String>.single(
                                selectedValue: Bite_length_vlaue,
                                title: 'Bite length',
                                choiceItems: Bite_length_List,
                                onChange: (state) => setState(() => Bite_length_vlaue = state.value)
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Bite_length_vlaue=='Billet' ? Row(
                            children: [
                              Expanded(child: Container(
                                child: TextFormField(
                                  controller: Bite_length,
                                  validator: (value) {
                                    if (value == null || value.isEmpty){
                                      return "Invalid Input";
                                    }
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                                    TextInputFormatter.withFunction((oldValue, newValue) {
                                      try {
                                        final text = newValue.text;
                                        if (text.isNotEmpty) double.parse(text);
                                        return newValue;
                                      } catch (e) {}
                                      return oldValue;
                                    }),],
                                  decoration: const InputDecoration(
                                    label: Text(' Length ( mm )' , style: TextStyle( fontSize: 24 ),),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.red),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),),
                              const SizedBox(width: 10,),
                              Expanded(child: Container(
                                child: TextFormField(
                                  controller: Bite_width,
                                  validator: (value) {
                                    if (value == null || value.isEmpty){
                                      return "Invalid Input";
                                    }
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                                    TextInputFormatter.withFunction((oldValue, newValue) {
                                      try {
                                        final text = newValue.text;
                                        if (text.isNotEmpty) double.parse(text);
                                        return newValue;
                                      } catch (e) {}
                                      return oldValue;
                                    }),],
                                  decoration: const InputDecoration(
                                    label: Text(' Width ( mm )' , style: TextStyle( fontSize: 24 ),),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.red),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ): Container(
                            child: TextFormField(
                              controller: Bite_length,
                              validator: (value) {
                                if (value == null || value.isEmpty){
                                  return "Invalid Input";
                                }
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                                TextInputFormatter.withFunction((oldValue, newValue) {
                                  try {
                                    final text = newValue.text;
                                    if (text.isNotEmpty) double.parse(text);
                                    return newValue;
                                  } catch (e) {}
                                  return oldValue;
                                }),],
                              decoration: const InputDecoration(
                                label: Text(' Bite length ( mm )' , style: TextStyle( fontSize: 24 ),),
                                contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3, color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3, color: Colors.red),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Number of points
                  Container(
                    margin:const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                    child: TextFormField(
                      controller: Number_of_Points,
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return "Invalid Input";
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          try {
                            final text = newValue.text;
                            if (text.isNotEmpty) double.parse(text);
                            return newValue;
                          } catch (e) {}
                          return oldValue;
                        }),],
                      decoration: const InputDecoration(
                        label: Text('Ratio' , style: TextStyle( fontSize: 24 ),),
                        contentPadding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  // button
                  ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          MU = double.parse(coefficient_of_friction.text);
                          Y = double.parse(Yield_strength.text);
                          H0 = double.parse(Initial_height_of_workpiece.text);
                          if (Final_height_of_work_piece_vlaue == "RR"){
                            double RR = double.parse(Final_height_of_work_piece.text);
                            HF = H0 * (1 - RR) ;
                          }
                          else {
                            HF = double.parse(Final_height_of_work_piece.text);
                          }
                          if(Bite_length_vlaue == 'Billet'){
                            BL = double.parse(Bite_length.text);
                            Bw = double.parse(Bite_width.text);
                            B = (((BL * Bw) * H0)/HF)/BL;
                          }
                          else if (Bite_length_vlaue == 'Cylinder'){
                            double temp = double.parse(Bite_length.text);
                            B = sqrt(((((pi * 0.25 * temp * temp) * H0)/HF)*4)/pi);
                          }
                          else{
                            B = double.parse(Bite_length.text);
                          }
                          no_points = double.parse(Number_of_Points.text) ;
                          CalcPressure();
                          attributes data = attributes(MU: MU, Y: Y, H0: H0, HF: HF, BL: BL, Bw: Bw, B: B, Pmax: Pmax, Pavg: Pavg, XTRANSITION: XTRANSITION() , no_point: no_points);
                          Navigator.pushNamed(context, Graph.routeName , arguments: data);
                        }

                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40 , vertical: 20))
                      ),
                      child: Text("Calc" , style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 22),)
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  double XTRANSITION(){
    double Xtransition = (B/2) - (HF/(2*MU)) * ( log((1/(2*MU)))/log(e));
    return Xtransition;
  }

  int CaseCheckIndex(){
    if(XTRANSITION()<= 0 ){
      return 0 ;
    }
    else if (XTRANSITION() >(B /2 )){
      return 1 ;
    }
    else if (XTRANSITION()>0 && XTRANSITION()< (B/2)){
      return 2;
    }
    print("invalid input");
    return -1;
  }
  // List<String> lubricationCasesList = ['It is Pure lubricant case' , 'It is Pure sticking case' , 'It is mixed case'];

  void CalcPressure(){
    if (CaseCheckIndex() == 1){
      Pmax = Y * (1 + (1 / HF) * (B / 2));
      Pavg = Y * (1 + (B / (4 * HF)));
    }
    else if (CaseCheckIndex() == 0){
      Pmax = Y * pow(e , ((MU * B)/HF));
      Pavg = ((Y * HF) / (MU * B)) * (pow(e , ((MU * B)/HF))-1);
    }
    else if (CaseCheckIndex() == 2){
      Pmax = Y * (1 + (B / (2 * HF)));
      SimpsonRule Function1 = SimpsonRule(function: '1 + ( 1 / $HF ) * ( ( $B / 2 ) - x )', lowerBound: 0, upperBound: XTRANSITION());
      SimpsonRule Function2 = SimpsonRule(function: 'e ^ ( (($MU * 2) / $HF )* (( $B / 2 ) - x ))', lowerBound: XTRANSITION(), upperBound: B/2);
      print ("${Function1.integrate().result}");
      print ("${Function2.integrate().result}");
      Pavg = ( Y /( B/2 ))* (Function1.integrate().result + Function2.integrate().result);
      print (Pavg);
    }
  }
}

class attributes {
  double MU ;
  double Y ;
  double H0 ;
  double HF ;
  double BL ;
  double Bw ;
  double B ;
  double Pmax ;
  double Pavg ;
  double XTRANSITION ;
  double no_point ;

  attributes ({
    required this.MU ,
    required this.Y ,
    required this.H0,
    required this.HF,
    required this.BL,
    required this.Bw,
    required this.B,
    required this.Pmax,
    required this.Pavg,
    required this.XTRANSITION,
    required this.no_point
  });
}
