import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/Transaction.dart';

class TransactionProvider with ChangeNotifier{
   List<Transaction> transactions = [];

   List<Transaction>getTransaction(){
    return transactions;
   }
   void addTransaction(Transaction statement){
      transactions.insert(0,statement);
      notifyListeners();
   }
}