import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptrend/models/profile_model.dart';
import 'package:taptrend/service/api_service.dart';
import 'package:taptrend/utils/colorz.dart';
import 'package:taptrend/widget/custom_text_button.dart';
import 'package:taptrend/widget/textformfield.dart';

import 'utils/helper.dart';
// import 'package:taptrend/widget/textformfield.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  static const routeName = '/createprofile-screen';
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {

  String ?image ;
  late SharedPreferences _sharedPreferences;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // TextEditingController addressController = TextEditingController();

  void init()async{
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _profileData();
    });
  }

  _updProfile()async{

    _sharedPreferences = await SharedPreferences.getInstance();
    ProfileModel profile = await ApiService.updateProfile(
      token: _sharedPreferences.getString('authToken')!,
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
        );

        if(profile.statusCode==200){
          if(mounted){
            Helper.showSnackBar(context: context, text: "Successfully Upadate",color: Colors.green);
            setState(() {
              // Navigator.pushNamed(context, NavigationMenu.routeName );
            });
          }
        }else{
          if(mounted){
            Helper.showSnackBar(context: context, text: profile.message!);
          }
        }
  }
  _profileData()async {
    _sharedPreferences = await SharedPreferences.getInstance();
    ProfileModel profile = await ApiService.profile(token: _sharedPreferences.getString('authToken')!);

    if( profile.body != null){
      nameController.text=profile.body!.name ?? '';
      emailController.text=profile.body!.email ?? '';
      phoneController.text=profile.body!.phone ?? '';
      // addressController.text=profile.body!.name ?? '';
      image=profile.body!.avatar ?? '';
      setState(() {
        
      });
    }else{
      if(mounted){
      Helper.showSnackBar(context: context, text: profile.message!);
    }
    }
  }

  @override
  void initState() {
    
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colorz.screenBackground,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const Text(
              'Create your profile',
              style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
              // color: Color(0xFFD7B56D),
              color: Color(0xffffffff),
              ),
            ),
            const SizedBox(height: 50,),

              Stack(
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    height: 150,
                    imageUrl: image != null ? image! : '',
                    errorWidget: (context, url, error) => const CircleAvatar(
                      radius: 70,
                      child: Text(''),
                      ),
                    ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: MaterialButton(
                    elevation: 1,
                    onPressed: (){},
                    shape: const CircleBorder(),
                    color:const Color(0xFFD7B56D),
                    child:const Icon(Icons.edit),
                  ),
                )
                ],
              ),
              const SizedBox(height: 30,),
            
              CustomTextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
              ),
              CustomTextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10,),
              CustomTextButton(
                text: 'Save Profile',
                onPressed: () {
                  _updProfile();
                },
                )
            ],
          ),
        ),
      ),
    );
  }
} 