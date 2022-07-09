import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  String label;
  final amount;
  double percentageSpent;
  ChartBar({ required this.label,required this.amount,required this.percentageSpent});

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints){
        return  Column(

            children: <Widget>[
              Container(
                  height:constraints.maxHeight*0.15,
                  child: FittedBox(child: Text("\$${amount.toStringAsFixed(0)}" ,style: Theme.of(context).textTheme.headline2,))
              ),
              SizedBox(height:constraints.maxHeight*0.05,),
              Container(
                height:constraints.maxHeight*0.65,
                width: 20,
                //color: Colors.teal,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      height: constraints.maxHeight*0.65,
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
              SizedBox( height:constraints.maxHeight*0.05,),
              Container( height: constraints.maxHeight*0.1,child: FittedBox(fit: BoxFit.contain ,child: Text(label)))

            ],

          
        );

      }),
    );
  }
}