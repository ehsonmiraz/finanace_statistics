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
             headline6:GoogleFonts.acme(textStyle :TextStyle(fontSize: 12))
         ),
         appBarTheme: AppBarTheme(titleTextStyle:GoogleFonts.acme())
     ),

     home: Home(),
   ) ;
  }
}
