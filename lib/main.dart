import 'package:google_fonts/google_fonts.dart';

import './screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
   return MaterialApp(
     theme: ThemeData(
         primarySwatch:Colors.blueGrey,
         accentColor: Colors.teal,
         textTheme: ThemeData.light().textTheme.copyWith(
             headline6:GoogleFonts.cabinSketch(textStyle :TextStyle(fontSize: 12)),
             headline5:GoogleFonts.cabinSketch(textStyle :TextStyle(color: Theme.of(context).primaryColor,fontSize: 28,fontWeight: FontWeight.bold),),
             headline4: GoogleFonts.cabinSketch(textStyle:TextStyle(color:Colors.amber,fontSize: 30,fontWeight: FontWeight.w600) ),
             headline3: GoogleFonts.cabinSketch(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 30,fontWeight: FontWeight.w500)),
             headline2: GoogleFonts.cabinSketch(textStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),

    ),
         appBarTheme: AppBarTheme( color:Colors.teal ,titleTextStyle:GoogleFonts.cabinSketch(textStyle:TextStyle(fontSize: 22,color: Colors.white70)))
     ),

     home: Home(),
   ) ;
  }
}
