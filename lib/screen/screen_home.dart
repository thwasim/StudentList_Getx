import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:main_project2/functions/db_functions.dart';
import 'package:main_project2/model/data_model.dart';
import 'package:main_project2/screen/add_students.dart';
import 'package:main_project2/screen/profile_student.dart';
import 'package:main_project2/screen/Search_screen.dart';

class Screenhome extends StatelessWidget {
  const Screenhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllstudents();
    return Scaffold(
      appBar: AppBar(
//============= set the app bar ================//
        backgroundColor: const Color.fromARGB(255, 106, 110, 69),
        title: const Text('students profiles'),
//==========set the icon button in appbar============//
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Searchscreen(),
                  ),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
//============== start with body ==============//
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        )),
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: studentlistnotifier,
            builder: (BuildContext ctx, List<Studentmodel> studentlist,
                Widget? child) {
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = studentlist[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((contxt) => Profilhome(
                                    name1: data.name,
                                    age1: data.age,
                                    number1: data.number,
                                    email1: data.email,
                                    id: data.id,
                                    imagesss: data.images,
                                  )),
                            ),
                          );
                        },
//=========== show the image in home page ====================//
                        trailing: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: IconButton(
                            onPressed: () async {
                               if (data.id != null) {
                                    delectestudent(data.id!);
                                  }
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            data.name,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CircleAvatar(
                              radius: 30,
                              child: data.images.trim().isNotEmpty
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage: MemoryImage(
                                          const Base64Decoder()
                                              .convert(data.images)),
                                    )
                                  :  Image.asset('assets/image1 (2).png')),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: studentlist.length,
              );
            },
          ),
        ),
      ),
//=============last set the icone button ==============//
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 75, 69, 247),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Addscreen(),
            ),
          );
        },
      ),
    );
  }
}
