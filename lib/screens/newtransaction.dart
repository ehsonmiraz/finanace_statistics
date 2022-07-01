import 'package:flutter/material.dart';
class NewTransaction extends StatefulWidget {
  final Function(String title, double amount) addTransaction;
    NewTransaction({Key? key,
    required this.addTransaction }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTransaction(){
    final String title=titleController.text;
    final double amount= double.parse(amountController.text);
    if(title.length<=0 || amount<=0 )
      return;

    widget.addTransaction(title,amount);
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Container(
        height: 280,
        padding: EdgeInsets.all(6),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(hintText: 'Title'),controller: titleController,onSubmitted: (_)=> submitTransaction(),),
            TextField(decoration: InputDecoration(hintText: 'Amount'),controller:amountController,onSubmitted: (_)=>submitTransaction(),keyboardType: TextInputType.number,),
            Row(
              children: <Widget>[
                Text("No date choosen"),
                FlatButton(
                  child:Text("Choose date",style: TextStyle(fontWeight:FontWeight.bold, color: Theme.of(context).primaryColor),) ,
                  onPressed: (){},

                ),
              ],
            ),
            RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: submitTransaction,
                child: Text('Submit Transaction',style: TextStyle(color:Colors.white),)),
          ],
        ),
      ),
    );
  }
}
