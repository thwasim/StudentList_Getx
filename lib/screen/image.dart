import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Imageshow extends StatelessWidget {
  Imageshow({Key? key, required this.imagesss}) : super(key: key);

  String imagesss = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 110, 69),
        title: const Text('Profile Image'),
      ),
      body: CircleAvatar(
        radius: 300,
        child: imagesss.trim().isNotEmpty
            ? CircleAvatar(
                radius: 300,
                backgroundImage: MemoryImage(
                  const Base64Decoder().convert(imagesss),
                ),
              )
            : Image.asset('assets/image1 (2).png'),
      ),
    );
  }
}