import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taptrend/create_profile_screen.dart';

import 'package:taptrend/home_screen.dart';
// import 'package:taptrend/insights_screen.dart';
import 'package:taptrend/login_page.dart';
// import 'package:taptrend/share_screen.dart';
// import 'package:taptrend/profile_screen.dart';
import 'package:taptrend/splashscreen.dart';


 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // enter full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // for setting orientation to protrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
   
   
    runApp(const MyApp());
 }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        
      ),
      home: const SplashScreen(),
       initialRoute: '/',
       routes: {
         SplashScreen.routeName:(context)  => const SplashScreen(),
         LoginScreen.routeName: (context) => const LoginScreen(),
         HomeScreen.routeName: (context) => const HomeScreen(),
         CreateProfileScreen.routeName: (context) => const CreateProfileScreen(),
        //  ShareScreen.routeName: (context) => const ShareScreen(),
        //  InsightScreen.routeName: (context) => const InsightScreen(),
       },
    );
  }
}


