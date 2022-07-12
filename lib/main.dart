import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:main_project2/functions/db_functions.dart';
import 'package:main_project2/model/data_model.dart';
import 'package:main_project2/splash.dart';


Future<void> main() async{

//============register the hive code============//

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentmodelAdapter().typeId)){
    Hive.registerAdapter(StudentmodelAdapter());
  
  }
  await getAllstudents();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
       home: const  Screensplah(),
        debugShowCheckedModeBanner: false,
    );
  }
}
