import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/home.dart';
import 'package:flutter/material.dart';

void main() {
//   WidgetsFlutterBinding.ensureInitialized();
 // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
   return MaterialApp(
     theme: ThemeData(
         primarySwatch:Colors.teal,
         accentColor: Colors.pinkAccent,
         textTheme: ThemeData.light().textTheme.copyWith(
             headline6:GoogleFonts.abel(textStyle :TextStyle(fontSize: 12)),
             headline5:GoogleFonts.abel(textStyle :TextStyle(color: Theme.of(context).primaryColor,fontSize: 28,fontWeight: FontWeight.bold),),
             headline4: GoogleFonts.abel(textStyle:TextStyle(color:Colors.amber,fontSize: 30,fontWeight: FontWeight.w600) ),
             headline3: GoogleFonts.abel(textStyle: TextStyle(color: Theme.of(context).primaryColor,fontSize: 30,fontWeight: FontWeight.w500)),
             headline2: GoogleFonts.abel(textStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
             button: TextStyle(color: Colors.white),
    ),
         appBarTheme: AppBarTheme( color:Colors.teal ,titleTextStyle:GoogleFonts.abel(textStyle:TextStyle(fontSize: 22,color: Colors.white))),

     ),

     home: Home(),
   ) ;
  }
}
