
import 'package:flutter/material.dart';
// import 'package:taptrend/models/login_model.dart';
// import 'package:taptrend/service/api_service.dart';

import 'package:taptrend/utils/colorz.dart';
import 'package:taptrend/widget/custom_textbutton.dart';
import 'package:taptrend/widget/textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
bool obscureText = true;
TextEditingController passwordController = TextEditingController();

// _login()async{
//   LoginModel login = await ApiService.login(
        
//       );
// }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body:Padding(
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
                    child: const CustomTextFormField(
                      fillColor: Colorz.insightBoxGradient1,
                      keyboardType: TextInputType.name,
                      hintText: "username",
                      prefixIcon: Icon(Icons.phone,color: Colorz.textSecondary,),
                    ),
              ),
              const SizedBox(height: 5,),

              Container(
                height: 60,
                    child:  CustomTextFormField(
                      controller: passwordController,
                      fillColor: Colorz.insightBoxGradient1,
                      obscureText: obscureText,
                      hintText: "password",
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Colorz.textSecondary,
                        ),
                      suffixIcon: IconButton(
                        color: Colorz.textSecondary,
                        icon: obscureText ? const Icon(Icons.remove_red_eye) : const Icon(Icons.visibility_off), 
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
    );
  }
}