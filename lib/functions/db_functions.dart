import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project2/model/data_model.dart';

//==========screenRefreeshing===========//
// ValueNotifier<List <Studentmodel>> studentlistnotifier = ValueNotifier([]);
var studentlist = RxList<Studentmodel>([]).obs;

//========== add all student list ==============//
Future <void> addstudent(Studentmodel value) async{
   final  studentDB = await Hive.openBox<Studentmodel>('Student_db');
   final _id = await studentDB.add(value);
   
   value.id = _id;
   await studentDB.put(value.id, value);
   studentlist.value.add(value);
   getAllstudents();
}

//==============data or list are fully show==============//

  Future<void> getAllstudents()async{
    final  studentDB = await Hive.openBox<Studentmodel>('Student_db');
    studentlist.value.clear();
    studentlist.value.addAll(studentDB.values);
  }

//===========delect the student delities in home page===========//

  Future<void> delectestudent(int id)async{
    final studentDB = await Hive.openBox<Studentmodel>('Student_db');
    await studentDB.delete(id);
    getAllstudents();
  }

//===========update the studentslist=============//

  Future<void>updatestudentdata(int id , Studentmodel value)async{
    
     final studentDB = await Hive.openBox<Studentmodel>('student_db');
    await studentDB.put(id, value);
     getAllstudents();
  }
  
  

 