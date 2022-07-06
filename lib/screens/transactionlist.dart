import 'package:finanace_statistics/models/transaction.dart';
import 'package:finanace_statistics/screens/templates/trasnsactiontemplate.dart';
import 'package:flutter/material.dart';


class TransactionList extends StatelessWidget{
  List <Transaction> transactions;
  Function(String id ) deleteTransaction;
  TransactionList({ Key? key ,required this.transactions, required this.deleteTransaction}) : super(key: key);
  Widget build(BuildContext context){
    return Container(
      
      child: ListView.builder(
        itemBuilder: (context,index){
          return TransactionCard(transactions[index],deleteTransaction);
        },
        itemCount: transactions.length,
      ),
    );
  }
}