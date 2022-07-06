import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  String label;
  final amount;
  double percentageSpent;
  ChartBar({ required this.label,required this.amount,required this.percentageSpent});

  @override
  Widget build(BuildContext context){
    return  Expanded(
      child: Column(

          children: <Widget>[
            Container(
                height:25,
                child: FittedBox(child: Text("\$${amount.toStringAsFixed(0)}" ,style: Theme.of(context).textTheme.headline2,))),
            SizedBox(height: 4,),
            Container(
              height: 100,
              width: 20,
              //color: Colors.teal,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(9),
                      color:Color.fromRGBO(200,220,216, 1),
                    ),
                  ),
                  FractionallySizedBox(
                      alignment: AlignmentDirectional.centerEnd,
                      heightFactor:  percentageSpent,
                      child:Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),color: Theme.of(context).primaryColor),
                      )
                  )
                ],
              ),
            ),
            SizedBox( height:3),
            Text(label)
             
          ],

      ),
    );
  }
}