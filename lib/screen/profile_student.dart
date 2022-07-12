import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_project2/screen/edite_screen.dart';
import 'package:main_project2/screen/image.dart';
import 'package:main_project2/screen/screen_home.dart';

class Profilhome extends StatelessWidget {
  final String name1;
  final String age1;
  final String number1;
  final String email1;
  int? id;
  final String imagesss;
  Profilhome({required this.name1,required this.age1,required this.number1,required this.email1,this.id, required this.imagesss,Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 110, 69),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: const Text(' Your Profile'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(
                  () => Editescreen(
                    name: name1,
                    age: age1,
                    phone: number1,
                    email: email1,
                    id: id,
                    imagesss: imagesss,
                  ),
                );
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                Get.to(()=>const Screenhome());
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 330,
            height: 600,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(35),
              gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            )),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'PROFILE',
                    style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Imageshow(imagesss: imagesss,)));
                  },
                  child: CircleAvatar(
                      radius: 80,
                      child: imagesss.trim().isNotEmpty
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage: MemoryImage(
                                const Base64Decoder().convert(imagesss),
                              ),
                            )
                          : Image.asset('assets/image1 (2).png'),),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '  NAME  :  $name1',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '  CLASS  :  $age1',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '  NUMBER  :  $number1',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  '  PLACE  :  $email1',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
