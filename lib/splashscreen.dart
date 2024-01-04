// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptrend/home_screen.dart';
import 'package:taptrend/login_page.dart';
// import 'package:taptrend/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/firest';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    late SharedPreferences _sharedPreferences;


void init()async{

   _sharedPreferences = await SharedPreferences.getInstance();

  var token = _sharedPreferences.getString('authToken');

  if(token != null){
    if(mounted){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
    
  }
  else{
    if(mounted){
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
   
  }
 
}
@override
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