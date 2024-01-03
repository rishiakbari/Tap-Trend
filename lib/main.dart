import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taptrend/firebase_options.dart';
import 'package:taptrend/splashscreen.dart';


 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // enter full screen
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // for setting orientation to protrait only
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
   
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
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
      home: const splashscreen(),
      //  initialRoute: '/',
      //  routes: {
      //    '/': (context) => const splashscreen(),
      //  },
    );
  }
}


