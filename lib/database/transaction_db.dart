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

}