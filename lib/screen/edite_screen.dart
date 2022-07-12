import 'dart:convert';
import 'package:main_project2/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:main_project2/functions/db_functions.dart';
import 'package:main_project2/screen/screen_home.dart';

class Editescreen extends StatelessWidget {
  final String name;
  final String age;
  final String phone;
  final String email;
  int? id;
  final String imagesss;

  Editescreen(
      {Key? key,
      required this.name,
      required this.age,
      required this.phone,
      required this.email,
      required this.imagesss,
      this.id})
      : super(key: key);

  final nameupdatecontroller = TextEditingController();
  final ageupdatecontroller = TextEditingController();
  final phoneupatecontroller = TextEditingController();
  final emailupatecontroller = TextEditingController();
  int numb = 1;

  @override
  Widget build(BuildContext context) {
//============= show the detiles of editing =============//

    nameupdatecontroller.text = name;
    ageupdatecontroller.text = age;
    phoneupatecontroller.text = phone;
    emailupatecontroller.text = email;

    return Scaffold(
//=========== set the the appbar ===============//
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 110, 69),
        title: const Text(' Edite Profile'),
      ),
//============= set the body =========//
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Edite',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                    radius: 80,
                    child: imagesss.trim().isNotEmpty
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: MemoryImage(
                              const Base64Decoder().convert(imagesss),
                            ),
                          )
                        : const SizedBox(
                            width: 50,
                            height: 50,
                          )),
                const SizedBox(
                  height: 30,
                ),
//============ show the editing screen ===========//
                TextField(
                  controller: nameupdatecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: const Color.fromARGB(255, 213, 223, 128),
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: ageupdatecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: const Color.fromARGB(255, 213, 223, 128),
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneupatecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: const Color.fromARGB(255, 213, 223, 128),
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailupatecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fillColor: const Color.fromARGB(255, 213, 223, 128),
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
//========== after updateing go to homescreen==========//
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Screenhome()),
                    );
                    updatestident();
                  },
                  child: const Text('Click update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//============ function of updateing studnet list =============//
  Future<void> updatestident() async {
    final namE = nameupdatecontroller.text;
    final agE = ageupdatecontroller.text;
    final phonE = phoneupatecontroller.text;
    final emaiL = emailupatecontroller.text;

    if (namE.isEmpty || agE.isEmpty || phonE.isEmpty || emaiL.isEmpty) {
      return;
    } else {
      final _detail = Studentmodel(
          name: namE,
          age: agE,
          number: phonE,
          email: emaiL,
          id: id,
          images: imagesss);

      updatestudentdata(id!, _detail);
    }
  }
}
