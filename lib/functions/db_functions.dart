import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project2/model/data_model.dart';

//==========screenRefreeshing===========//
ValueNotifier<List <Studentmodel>> studentlistnotifier = ValueNotifier([]);
//========== add all student list ==============//
Future <void> addstudent(Studentmodel value) async{
   final  studentDB = await Hive.openBox<Studentmodel>('student_db');
   final _id = await studentDB.add(value);
   value.id = _id;
   await studentDB.put(value.id, value);
   studentlistnotifier.value.add(value);
   studentlistnotifier.notifyListeners();
}

//==============data or list are fully show==============//

  Future<void> getAllstudents()async{
    final  studentDB = await Hive.openBox<Studentmodel>('student_db');
    studentlistnotifier.value.clear();
    studentlistnotifier.value.addAll(studentDB.values);
       studentlistnotifier.notifyListeners();
  }

//===========delect the student delities in home page===========//

  Future<void> delectestudent(int id)async{
    final studentDB = await Hive.openBox<Studentmodel>('student_db');
    await studentDB.delete(id);
    getAllstudents();
  }

//===========update the studentslist=============//

  Future<void>updatestudentdata(int id , Studentmodel value)async{
    
     final studentDB = await Hive.openBox<Studentmodel>('student_db');
    await studentDB.put(id, value);
     getAllstudents();
  }
  
  
//==========image converting string function ============\\

  String img =' ';

   addimage(XFile pickimage) async{
     // ignore: unnecessary_null_comparison
     if(pickimage == null){
       return;
     }else{
      
       final bytes = File(pickimage.path).readAsBytesSync();
       img = base64Encode(bytes);
     }
   }
 




