import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
 Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Form(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: new InputDecoration(labelText: "ชื่อรายการ"),
            autofocus: true,
          ),
          TextFormField(
            decoration: new InputDecoration(labelText: "จำนวนเงิน"),
            keyboardType: TextInputType.number,
          ),
          FloatingActionButton(
            child: Text("เพิ่มข้อมูล"),
            onPressed: (){
              Navigator.pop(context);
            },
            )
        ],
        ),
        ));
  }
}