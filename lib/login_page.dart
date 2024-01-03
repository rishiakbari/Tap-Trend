
import 'package:flutter/material.dart';
import 'package:taptrend/service/api_service.dart';
import 'package:taptrend/utils/api.dart';
// import 'package:taptrend/models/login_model.dart';
// import 'package:taptrend/service/api_service.dart';

import 'package:taptrend/utils/colorz.dart';
import 'package:taptrend/widget/custom_textbutton.dart';
import 'package:taptrend/widget/textformfield.dart';

import 'models/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final _formkey= GlobalKey<FormState>();
bool obscureText = true;
TextEditingController passwordController = TextEditingController();
TextEditingController userNameController= TextEditingController();

_login()async{
  LoginModel login = await ApiService.login(username: userNameController.text, password: passwordController.text);
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
               Container(
                  height: 60,
                      child:  CustomTextFormField(
                        // validator: (val) => val!=null && val.isNotEmpty
                        // ? null
                        // : 'please enter your currect name',
                        controller: userNameController,
                        validator: (p0) {
                          if(p0!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(p0!)){
                            return "please enter your currect name";
                          }else{
                            return null;
                          }
                        },
                        fillColor: Colorz.insightBoxGradient1,
                        keyboardType: TextInputType.name,
                        hintText: "username",
                        prefixIcon: const Icon(Icons.phone,color: Colorz.textSecondary,),
                      ),
                ),
                const SizedBox(height: 5,),
        
                Container(
                  height: 60,
                      child:  CustomTextFormField(
                        validator: (val) {
                          if(val!.isEmpty || RegExp(r'^[+]*[()]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(val!)){
                            return "please enter your currect phone number";
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
                ),
        
                
               const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Or Continue With',style: TextStyle(color: Colorz.textSecondary,),)
                  ],
                ),
        
                 const SizedBox(height: 8,),
                Container(
                  child: CustomTextButton(
                    text: "Login",
                    onPressed: () {
                      if(_formkey.currentState!.validate()){
                        // check if data are valid
                        _formkey.currentState?.save;
                        // Api.
                        print('Login Successfully!');
                      }
                      _login();
        
                    },
                    textColor: Colorz.textBlack,
                    ),
                    
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