import 'package:google_fonts/google_fonts.dart';

import 'newtransaction.dart';
import 'transactionlist.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
State<Home> createState() => _HomeSate() ;
}

class _HomeSate extends State<Home>{
 final List<Transaction> transactions=[

 ];
/*Transaction(id: '001', title: 'Leather Shoes', amount: 1200, date: DateTime.now() ),
  Transaction(id: '002', title: 'Sports Bra', amount: 800, date: DateTime.now() ),
    */

 void addTransaction(String title, double amount){
   setState((){
     transactions.add(Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now()));
     Navigator.pop(context);
   });
   }
 void startNewTransaction( BuildContext ctx){
   showModalBottomSheet(context: ctx, builder: (bCtx)=> NewTransaction(addTransaction: addTransaction,));

 }

 Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        title: Text('Expense Calculator'),
        actions: <Widget>[IconButton(onPressed:() => startNewTransaction(context), icon: Icon(Icons.add))],
   ),
   body:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        Container(
          width:double.infinity,
          height: 35,
          child:Card(
            color: Colors.blueAccent,
            child: Text('Chart'),
            elevation: 6,
          ),
        ),

        transactions.isNotEmpty ? TransactionList(transactions: transactions): Container(
          child: Column(
            children: [
              Text('No transaction yet ! Add transaction now.',style:Theme.of(context).textTheme.headline2),
              SizedBox(height: 18,),
              Image.asset('assets/images/No_Transaction.png',fit: BoxFit.cover,),
            ],
          ),),



      ],
    ),
   floatingActionButton: FloatingActionButton(onPressed:() => startNewTransaction(context), child: Icon(Icons.add),),
    );
  }
}