import 'package:hive_flutter/hive_flutter.dart';

part 'data_model.g.dart';


   @HiveType(typeId: 1)


class Studentmodel {

  @HiveField(0)
  int? id;
  @HiveField(1)
  final String  name;

  @HiveField(2)
  final String  age;

  @HiveField(3)
  final String number;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String images;
  

  Studentmodel({
     required this.name,
      required this.age,
       required this.number,
       required this.email ,
        this.id,
         required this.images
         });
}