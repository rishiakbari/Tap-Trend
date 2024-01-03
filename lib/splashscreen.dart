// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptrend/home_screen.dart';
import 'package:taptrend/login_page.dart';
// import 'package:taptrend/loginpage.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  static const routeName = '/firest';

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

    late SharedPreferences _sharedPreferences;


void init()async{
  var _sharedPreferences = await SharedPreferences.getInstance();
  var token = _sharedPreferences.getString('authToken');
  if(token != null){
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }else{
   Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
 
}
  void initState(){
    super.initState();
     Future.delayed(const Duration(milliseconds:4500),(){
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      init();
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