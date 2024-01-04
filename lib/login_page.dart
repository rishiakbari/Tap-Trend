
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptrend/home_screen.dart';
import 'package:taptrend/models/login_model.dart';
import 'package:taptrend/service/api_service.dart';

// import 'package:taptrend/utils/api.dart';
// import 'package:taptrend/models/login_model.dart';
// import 'package:taptrend/service/api_service.dart';

import 'package:taptrend/utils/colorz.dart';
import 'package:taptrend/utils/helper.dart';
import 'package:taptrend/widget/custom_text_button.dart';
import 'package:taptrend/widget/textformfield.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/second';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final _formkey= GlobalKey<FormState>();
bool obscureText = true;
TextEditingController passwordController = TextEditingController();
TextEditingController userNameController= TextEditingController();
late SharedPreferences _sharedPreferences;

void _init() async {
    
  //  var isLoggined= _sharedPreferences.getBool('login');
}

_login()async{
   _sharedPreferences = await SharedPreferences.getInstance();
  LoginModel login = await ApiService.login(username: userNameController.text, password: passwordController.text);
  // print(login.statusCode);
  
  if (login.body!=null){
    // print(login.body);
    _sharedPreferences.setString('authToken', login.body!.token.toString());
          _sharedPreferences.setString('authUser', jsonEncode(login.body!));
          if(mounted){
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }
    
  }else{
    if(mounted){
      Helper.showSnackBar(context: context, text: login.message!);
    }
    
  }

}
@override
  void initState() {
    super.initState();
    _init();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body:Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,),
          child: Column(
            children: [
                 Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
                    child: Image.asset(
                      'images/logo.png',
                      width: 300,
                      height: 250,),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 220),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colorz.textPrimary,
                        fontSize: 25,
                        fontWeight: FontWeight.normal
                        ),),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 75),
                    child: const Text(
                      'Please enter your phone number', 
                      style:TextStyle(color: Colorz.textSecondary, fontSize: 15),),
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
               CustomTextFormField(
                 controller: userNameController,
                 // validator: (isLoggined) => isLoggined!=null && isLoggined.isNotEmpty
                 // ? null
                 // : 'please enter your currect name',
                 
                 validator: (isLoggined) {
                   if(isLoggined!.isEmpty){
                     return "required field";
                   }else{
                     return null;
                   }
                 },
                 fillColor: Colorz.insightBoxGradient1,
                 keyboardType: TextInputType.name,
                 hintText: "username",
                 prefixIcon: const Icon(Icons.phone,color: Colorz.textSecondary,),
               ),
                const SizedBox(height: 5,),
        
                CustomTextFormField(
                  validator: (isLoggined) {
                    if(isLoggined!.isEmpty){
                      return "required field";
                    }else{
                      return null;
                    }
                  },
                  controller: passwordController,
                  fillColor: Colorz.insightBoxGradient1,
                  obscureText: obscureText,
                  hintText: "password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colorz.textSecondary,
                    ),
                  suffixIcon: IconButton(
                    color: Colorz.textSecondary,
                    icon: obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off), 
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }),
                ),
        
                
               const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Or Continue With',style: TextStyle(color: Colorz.textSecondary,),)
                  ],
                ),
        
                 const SizedBox(height: 8,),

                CustomTextButton(
                  text: "Login",
                  onPressed: () {
                    
                    // check if data are valid
                    if(_formkey.currentState!.validate()){
                      // print("Success1fully");
                      _login();
                    }
                    }
                        ,
                  textColor: Colorz.textBlack,
                  ),
                const SizedBox(height: 100,),
          
                const Text(
                  'By Tapping on Continue, you agree to our',
                  style: TextStyle(
                    color: Colorz.textSecondary,
                    ),),
          
                   const InkWell(
                     child:  Text('Terms & Condition, Privacy Policy',
                      style: TextStyle(
                        color: Colorz.textPrimary,
                      ),
                      ),
                   )
            ],
          ),
        ),
      ),
    );
  }
  
  
}