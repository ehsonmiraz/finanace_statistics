import './screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
   return MaterialApp(

     home: Scaffold(
       appBar: AppBar(
         title: Text('Finance Calculator'),
         actions: <Widget>[Text('action'),],
       ),
       body:Home(),

     ),
   ) ;
  }
}
