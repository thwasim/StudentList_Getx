import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_project2/functions/db_functions.dart';
import 'package:main_project2/model/data_model.dart';
import 'package:main_project2/screen/Screen_home.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  final _namecontroller = TextEditingController();
  final _classcontroller = TextEditingController();
  final _numbercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  File? imagefile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
//===============set the app bar==============//
      appBar: AppBar(
        backgroundColor:const  Color.fromARGB(255, 106, 110, 69),
      ),
//=============set the body==========//
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
          child: ListView(
            children: [
              imageprofile(context),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Add Students List',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
//===========set the all textfromfield==============//
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 213, 223, 128),
                      filled: true,
                      hintText: 'Enter Students Name',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _classcontroller,
                  decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 213, 223, 128),
                      filled: true,
                      hintText: 'Enter Your Class',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _numbercontroller,
                  decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 213, 223, 128),
                      filled: true,
                      hintText: 'Enter Phone Number',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 213, 223, 128),
                      filled: true,
                      hintText: 'Enter Your Place',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    onaddstudentbuttonclick();
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Screenhome()),
                    );
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//=========Function Image taking Gallery=============//

  Future<void> takeGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTempray = File(image.path);

    setState(() {
      imagefile = imageTempray;
    });
    addimage(image);
  }

//============Function Take Image In camera ============//
  Future<void> takeimage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTempray = File(image.path);

    setState(() {
      imagefile = imageTempray;
    });
    addimage(image);
  }

  imageprofile(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          showBottom(context);
        },
        child: Stack(
          children: [
            imagefile == null
                ? Image.asset(
                    'assets/image1.png',
                    width: 140,
                    height: 140,
                  )
                : Image.file(
                    imagefile!,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
            //======== set select image ontext ===========//
            Positioned(
              top: 85,
              right: 2,
              child: TextButton(
                onPressed: () {
                  showBottom(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'SELECT IMAGE',
                    style: TextStyle(color: Color.fromARGB(255, 255, 17, 0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//============ camera and Gallery bottom page =============//
  Future<void> showBottom(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          )),
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Choice Profile Photo',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),

//=========set the position bottomsheet===========//
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      takeimage();
                    },
                    icon: const Icon(Icons.camera, color: Color.fromARGB(255, 255, 255, 255)),
                    label: const Text(
                      'Camera',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  TextButton.icon(
                      onPressed: () {
                        takeGallery();
                      },
                      icon: const Icon(
                        Icons.image,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      label: const Text(
                        'Gallery',
                        style: TextStyle(color: Colors.white),
                      )
                   ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }

//======set the detiles shown by homepage========//
  Future<void> onaddstudentbuttonclick() async {
    final _name = _namecontroller.text;
    final _age = _classcontroller.text;
    final _number = _numbercontroller.text;
    final _email = _emailcontroller.text;
    if (_name.isEmpty || _age.isEmpty || _number.isEmpty || _email.isEmpty) {
      return;
    }
//=============passing the object of full detiles==========//
    final _student = Studentmodel(
        name: _name, age: _age, number: _number, email: _email, images: img);
//==========add the full detiles=============//
    addstudent(_student);
  }
}
