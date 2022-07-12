import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_project2/functions/db_functions.dart';
import 'package:main_project2/screen/add_students.dart';
import 'package:main_project2/screen/home_list.dart';
import 'Search_screen.dart';

class Screenhome extends StatelessWidget {
  const Screenhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllstudents();
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 110, 69),
        title: const Text('students profiles'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          IconButton(
              onPressed: () {
                Get.to(() => const Searchscreen());
              },
              icon: const Icon(Icons.search)),
        ],
      ),
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
        child: Column(
          children: const [Expanded(child: Screenlist())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 75, 69, 247),
          onPressed: () {
            Get.to(() => const Addscreen());
          }),
    );
  }
}
