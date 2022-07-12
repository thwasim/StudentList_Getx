import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_project2/functions/db_functions.dart';
import 'package:main_project2/screen/profile_student.dart';

class Screenlist extends StatelessWidget {
  const Screenlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ((() => ListView.separated(
            itemBuilder: (ctx, index) {
              final data = studentlist.value[index];
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
                      Get.to(() => Profilhome(
                            name1: data.name,
                            age1: data.age,
                            number1: data.number,
                            email1: data.email,
                            id: data.id,
                            imagesss: data.images,
                          ));
                    },
//=========== show the image in home page ====================//
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: IconButton(
                        onPressed: () async {
                          Get.defaultDialog(
                            title: 'Remove This Details',
                            middleText: '',
                            textCancel: 'Cancel',
                            cancelTextColor: Colors.black,
                            textConfirm: 'Delete',
                            confirmTextColor: Colors.black,
                            onCancel: () {
                              Navigator.of(context).pop();
                            },
                            onConfirm: () {
                              if (data.id != null) {
                                delectestudent(data.id!);
                              }
                              Get.snackbar(
                                'Student List',
                                'Remove This Details',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.black,
                                colorText: Colors.white,
                                duration: const Duration(seconds: 1),
                              );
                              Navigator.of(context).pop();
                            },
                          );
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
                          child:data.images.trim().isNotEmpty
                              ? CircleAvatar(
                                  radius: 60,
                                  backgroundImage: MemoryImage(
                                      const Base64Decoder()
                                          .convert(data.images)),
                                )
                              : Image.asset('assets/image1 (2).png'),),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            },
            itemCount: studentlist.value.length,
          ))),
    );
  }
}
