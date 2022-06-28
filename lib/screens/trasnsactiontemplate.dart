import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget{
  Transaction tx;
  TransactionCard(this.tx);
  Widget build(BuildContext context){
     return Container(
       width:double.infinity,
       height: 120,
       child:Card(
         color: Colors.white70,
         elevation: 6,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Container(
               padding: EdgeInsets.all(5),
               margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
               decoration: BoxDecoration(border: Border.all(
                 color: Theme.of(context).primaryColor,
                 width: 3,
               ),
               ),
               child: Text('\$ ${tx.amount.toString()}' ,style: Theme.of(context).textTheme.headline4)
             ),
             Column(
               mainAxisAlignment: MainAxisAlignment.center ,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(child: Text(tx.title,style: Theme.of(context).textTheme.headline3,),),
                 Container(child: Text(DateFormat.yMMMd().format(tx.date),style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold)),
                 )
                         ],
//DateFormat.yMMMd().format(tx.date)
           ),
           ],
         ),
       ),
     );
  }
}