import 'package:flutter/material.dart';
import 'package:main_project2/screen/screen_home.dart';

class Screensplah extends StatefulWidget {
  const Screensplah({Key? key}) : super(key: key);

  @override
  State<Screensplah> createState() => _ScreensplahState();
}

class _ScreensplahState extends State<Screensplah> {
  @override
  void initState() {
    gohome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image.network(''),
         const SizedBox(height:200 ,),
          Image.network(''),
        ],
        
      ),
    );
  }

  Future<void> gohome() async {
    await Future.delayed(const Duration(seconds: 6));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>const Screenhome(),
    ));
  }
}