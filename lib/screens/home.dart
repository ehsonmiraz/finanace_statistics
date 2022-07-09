import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './chart.dart';
import 'package:google_fonts/google_fonts.dart';

import 'newtransaction.dart';
import 'transactionlist.dart';
import '../models/transaction.dart';


class Home extends StatefulWidget{
State<Home> createState() => _HomeSate() ;
}

class _HomeSate extends State<Home>{
 final List<Transaction> transactions=[];
/*Transaction(id: '001', title: 'Leather Shoes', amount: 1200, date: DateTime.now() ),
  Transaction(id: '002', title: 'Sports Bra', amount: 800, date: DateTime.now() ),
    */
 void deleteTransaction(String id){
  setState((){transactions.removeWhere((tx) => tx.id==id);});

}
 void addTransaction(String title, double amount, DateTime datePicked){
   setState((){
     transactions.add(Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: datePicked));
     Navigator.pop(context);
   });
   }
 void startNewTransaction( BuildContext ctx){
   showModalBottomSheet(context: ctx, builder: (bCtx)=> NewTransaction(addTransaction: addTransaction,));

 }

 List<Transaction> get recentTransactions{
   return transactions.where(
           (tx) { return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));  }
               ).toList();
}
 bool _showChart=false;

 Widget build(BuildContext context){
   bool _isLandscape= MediaQuery.of(context).orientation == Orientation.landscape;

  final PreferredSizeWidget appBar= Platform.isIOS
      ? CupertinoNavigationBar(
       middle:Text("Personal Expense "),
       trailing:CupertinoButton(
         child:Icon(Icons.add),
         onPressed:(){ startNewTransaction(context);},) ,
  )
      :  AppBar(
    title: Text('Personal Expense '),
    actions: <Widget>[IconButton(onPressed:() => startNewTransaction(context), icon: Icon(Icons.add))],
  ) as PreferredSizeWidget;

  final panelHeight=(MediaQuery.of(context).size.height- appBar.preferredSize.height -MediaQuery.of(context).padding.top);
  final txListWidget=transactions.isNotEmpty ?Container(
      height:panelHeight*0.70,
      child: TransactionList(transactions: transactions, deleteTransaction: deleteTransaction,)
  )  :Container(
    height: panelHeight*0.8,
    child: Column(
      children: <Widget>[
        Text('No transaction yet ! Add transaction now.',style:Theme.of(context).textTheme.headline2),
        SizedBox(height: panelHeight*0.04,),
        Container(height : panelHeight*0.25 , child: Image.asset('assets/images/No_Transaction.png',fit: BoxFit.cover,)),
      ],
    ),
  ) ;
  final pageBody= SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        if(_isLandscape) Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Show chart"),
            Switch(value: _showChart, onChanged: (value){setState(()=> _showChart=value);}),
          ],
        ),//show switch only in lanscape mode
        if(!_isLandscape) Container(
            height:panelHeight*0.25,
            child: Chart(recentTransactions)
        ),//if portrait then show chart with less length
        if(!_isLandscape)  txListWidget,// if portrait show tx list below above chart
        if(_isLandscape) _showChart? Container(
            height:panelHeight*0.75,
            child: Chart(recentTransactions)
        ): txListWidget// if lanscape then either show chart or txlist controlled by switch

      ],
    ),
  );
  return Platform.isIOS
      ? CupertinoPageScaffold(child: pageBody)
      :  Scaffold(
        appBar: appBar,
        body: pageBody,
   floatingActionButton: FloatingActionButton(onPressed:() => startNewTransaction(context), child: Icon(Icons.add),),
    );
  }
}