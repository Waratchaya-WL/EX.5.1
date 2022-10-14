import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Transactions.dart';
import 'package:flutter_application_1/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final titlController = TextEditingController();
  final amountController = TextEditingController();
  @override
 Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Form(
        key: formKey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: new InputDecoration(labelText: "ชื่อรายการ"),
            autofocus: true,
            controller: titlController,
            validator: (String str){
                if(str.isEmpty){
                  return"กรุณาป้อนชื่อรายการ";
                }
                return null;
            },
          ),
          TextFormField(
            decoration: new InputDecoration(labelText: "จำนวนเงิน"),
            keyboardType: TextInputType.number,
            controller: amountController,
            validator: (String str){
              if(str.isEmpty){
                return "กรุณาป้อนจำนวนเงิน";
              }
              if(double.parse(str)<=0){
                    return "กรุณาป้อนตัวเลขมากกว่า 0";
              }
              return null;
            },
          ),
          FloatingActionButton(
            child: Text("เพิ่มข้อมูล"),
            onPressed: (){
              if(formKey.currentState.validate()){
                var title = titlController.text;
                var amount = amountController.text;

                Transactions statement = Transactions();
                 title: title,
                 amount: double.parse(amount),
                 date:DateTime.now()
                var provider = Provider.of<TransactionProvider>(context,listen:false);
                provider.addTransaction(statement);
              Navigator.pop(context);
              }
            },
            )
        ],
        ),
        ));
  }
}