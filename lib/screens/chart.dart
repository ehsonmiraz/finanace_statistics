import 'package:finanace_statistics/screens/templates/chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget{

  List<Transaction>  recentTransactions ;
  List<Map<String,Object>> get groupedTransaction{
    return List.generate(7,(index){
      double amount=0.0;
      final weekDay= DateTime.now().subtract(Duration(days: index));
      for(int i=0; i<recentTransactions.length;i++){
          if(recentTransactions[i].date.day==weekDay.day &&recentTransactions[i].date.month==weekDay.month &&recentTransactions[i].date.year==weekDay.year )
            amount+=recentTransactions[i].amount;
      }
      return{'day': DateFormat.E().format(weekDay).substring(0,1) ,'amount': amount} ;
    }
    ).reversed.toList();
  }

  double get totalSpending{
     if(groupedTransaction.isEmpty)
       return 0.0;
     return groupedTransaction.fold(0.0, (sum, item) {
       return sum != null ? sum +
           (item['amount'] as double) : 0.0;
     });
  }

   Chart(this.recentTransactions);
   Widget build(BuildContext context){
     return Card(
       elevation: 6,
      // margin: EdgeInsets.all(10),
       //color: Colors.tealAccent,
       child: Row(
         children: groupedTransaction.map((tx){
             return ChartBar(label: tx['day'].toString(), amount: (tx['amount'] as double),percentageSpent:totalSpending!=0.0?(tx['amount'] as double)/totalSpending:0.0);
         }).toList(),
       ),
     );
   }
}