import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TransactionCard extends StatelessWidget{
  Transaction tx;
  TransactionCard(this.tx);
  Widget build(BuildContext context){
     return Card(
         color: Colors.white,
         elevation: 6,
         child: ListTile(
           leading:CircleAvatar(

               backgroundColor: Colors.teal,
               radius:30 ,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: FittedBox(child: Text('\$ ${tx.amount.toString()}',style: TextStyle(color: Colors.white), )),
               ),
           ),
           title:Text(tx.title,style: Theme.of(context).textTheme.headline3,) ,
           subtitle:Text(DateFormat.yMMMd().format(tx.date),style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold)) ,



         )
     );
  }
}

/**
 *
 * Row(
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
    child:
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.center ,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(child: ),
    Container(child: ,
    )
    ],
    //DateFormat.yMMMd().format(tx.date)
    ),
    ],
 */
