import 'newtransaction.dart';
import 'transactionlist.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{

State<Home> createState() => _HomeSate() ;
}

class _HomeSate extends State<Home>{
 final List<Transaction> transactions=[
   Transaction(id: '001', title: 'Leather Shoes', amount: 1200, date: DateTime.now() ),
   Transaction(id: '002', title: 'Sports Bra', amount: 800, date: DateTime.now() ),
 ];

 void addTransaction(String title, double amount){
   setState((){
     transactions.add(Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now()));

   });
   }
 Widget build(BuildContext context){
    return Column(
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
        NewTransaction(addTransaction: addTransaction,),
        TransactionList(transactions: transactions),



      ],
    );
  }
}