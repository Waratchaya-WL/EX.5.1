import 'package:flutter_application_1/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB{
     //บริการเกี่ยวกับฐานข้อมูล
     String dbName;//เก็บชื่อฐานข้อมูล

     TransactionDB({this.dbName});

     //user
     Future <Database>  openDatabase() async{
         //หาตำแหน่งที่จะเก็บข้อมูล
         Directory appDirectory = await getApplicationSupportDirectory();
         String dbLocation = join(appDirectory.path,dbName);
         DatabaseFactory dataFactory = await databaseFactoryIo;
         Database db = await dbFactory.openDatabase(dbLocation);
         return db;
     }
       Future <int> InsertData(Transactions statement) async{
       var db = await this.openDatabase();
       var store = intMapStoreFactory.store("expense");
       var keyID=store.add(db, {
        "title":statement.title,
        "amount":statement.amount,
        "date":statement.date.toIso8601String()
       });
       db.close();
       return keyID;

       }
}