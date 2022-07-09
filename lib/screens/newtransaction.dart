import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function(String title, double amount, DateTime datePicked) addTransaction;
    NewTransaction({Key? key,
    required this.addTransaction }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? datePicked;
  void submitTransaction(){

    final String title=titleController.text;
    final double amount= double.parse(amountController.text);
    if(title.length<=0 || amount<=0 )
      return;

    widget.addTransaction(title,amount,datePicked!);
  }
  
  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime.now()).then((value) {
    setState((){
      datePicked=value!;
    })  ;

    });
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Card(
        child: Container(
          //height: MediaQuery.of(context).size.height*0.45,
          padding: EdgeInsets.only(top:5,left: 5,right:5,bottom: MediaQuery.of(context).viewInsets.bottom+30),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(decoration: InputDecoration(hintText: 'Title'),controller: titleController,onSubmitted: (_)=> submitTransaction(),),
              TextField(decoration: InputDecoration(hintText: 'Amount'),controller:amountController,onSubmitted: (_)=>submitTransaction(),keyboardType: TextInputType.number,),
              Row(
                children: <Widget>[
                  datePicked!=null? Text("Date picked ${DateFormat.yMd().format(datePicked!)}") :Text("No date choosen"),
                  FlatButton(
                    child:Text("Choose date",style: TextStyle(fontWeight:FontWeight.bold, color: Theme.of(context).primaryColor),) ,
                    onPressed: _presentDatePicker,

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
      ),
    );
  }
}
