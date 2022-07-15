import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

 class TransactionCard extends StatefulWidget{
  Transaction tx;
  Function(String id) deleteTransaction;

  TransactionCard({Key? key, required this.tx, required this.deleteTransaction}):super(key:key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();


}

class _TransactionCardState extends State<TransactionCard> {
  late Color _randColor;
  @override
  void initState(){

    _randColor= [Colors.redAccent,Colors.amber,Colors.blueAccent,Colors.lightBlue][Random().nextInt(4)] as Color;
    super.initState();
  }

  Widget build(BuildContext context){
     return Card(
         color: Colors.white,
         elevation: 6,
         child: ListTile(
           leading:CircleAvatar(
               backgroundColor: _randColor,
               radius:30 ,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: FittedBox(child: Text('\$ ${widget.tx.amount.toString()}',style: TextStyle(color: Colors.white), )),
               ),
           ),
           title:Text(widget.tx.title,style: Theme.of(context).textTheme.headline3,) ,
           subtitle:Text(DateFormat.yMMMd().format(widget.tx.date),style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold)) ,
           trailing: MediaQuery.of(context).size.width>400? FlatButton.icon( textColor:Theme.of(context).primaryColor, onPressed: ()=> widget.deleteTransaction(widget.tx.id), icon: Icon(Icons.delete), label: Text("Delete")) : IconButton(color:Theme.of(context).primaryColor,icon: Icon(Icons.delete,),onPressed: (){widget.deleteTransaction(widget.tx.id);},),


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
