import 'package:flutter/material.dart';
import 'package:main_project2/functions/db_functions.dart';
import 'package:main_project2/model/data_model.dart';
import 'package:main_project2/screen/profile_student.dart';
import 'package:main_project2/screen/screen_home.dart';

ValueNotifier<List<Studentmodel>> temp = ValueNotifier([]);

class Searchscreen extends StatelessWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 106, 110, 69),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: TextField(
//=============set the function of search bar===============//
                onChanged: (String? value) {
                  if (value == null || value.isEmpty) {
                    temp.value.addAll(studentlistnotifier.value);
                    // temp.notifyListeners();
                  } else {
                    temp.value.clear();
                    for (Studentmodel i in studentlistnotifier.value) {
                      if (i.name.toLowerCase().contains(value.toLowerCase())) {
                        temp.value.add(i);
                      }
                      // temp.notifyListeners();
                    }
                  }
                },
                decoration: InputDecoration(
                  hintText: ' Search...',
//========clear button set at last====================//
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screenhome()),
                      );
                    },
                  ),
                ),
              ),
            ),
          )),
//===================start the body============//
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
                valueListenable: temp,
                builder: (
                  BuildContext ctx,
                  List<Studentmodel> serachdata,
                  Widget? child,
                ) {
                  return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = serachdata[index];
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
                                title: Center(child: Text(data.name)),
                                onTap: () {
//============after searching result tuching show the detelis================//
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => Profilhome(
                                            name1: data.name,
                                            age1: data.age,
                                            number1: data.number,
                                            email1: data.email,
                                            imagesss: data.images,
                                          )));
                                }),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider();
                      },
                      itemCount: serachdata.length);
                })),
      ),
    );
  }
}
