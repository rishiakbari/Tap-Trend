// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taptrend/login_page.dart';
// import 'package:taptrend/loginpage.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  void initState(){
    super.initState();
    Future.delayed(const Duration(milliseconds:4500),(){
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    body: Center(
       child: Image.asset('images/intro.gif'),
//       child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//       Container(
//       child: Image.asset('images/intro.gif'),
//   )
//  ],
      ),
    );
  }
}