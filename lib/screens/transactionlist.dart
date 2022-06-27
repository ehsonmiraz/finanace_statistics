import 'package:finanace_statistics/models/transaction.dart';
import 'package:finanace_statistics/screens/trasnsactiontemplate.dart';
import 'package:flutter/material.dart';


class TransactionList extends StatelessWidget{
  List <Transaction> transactions;
  TransactionList({ Key? key ,required this.transactions}) : super(key: key);
  Widget build(BuildContext context){
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context,index){
          return TransactionCard(transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}