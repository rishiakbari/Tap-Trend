import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:taptrend/widget/textformfield.dart';


import 'utils/colorz.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  static const routeName = '/share-screen';
  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {

  String  defaultValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBarScreen(),
      backgroundColor: Colorz.screenBackground,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colorz.main),
      ),
      body :ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40,),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colorz.main,width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: defaultValue,
                  isExpanded: true,
                  // isDense: true,
                  menuMaxHeight: 350,
                  items: const [
                  DropdownMenuItem (
                  value: "",
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Card",style: TextStyle(color: Colorz.main,fontSize: 18),
                    ),
                  ),
                  ),
                  ],
                  onChanged: (value){},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('images/dharmesh.png'),
            ),
          ),
         const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
               const CustomTextFormField(
                  hintText: "https://profile.taptrend.in/",
                  suffixIcon: Icon(TablerIcons.copy,color: Colorz.textSecondary,),
                ),
               const CustomTextFormField(
                  hintText: "Custom url name",
                  suffixIcon: Icon(TablerIcons.check,color: Colorz.textSecondary,),
                ),
               const SizedBox(height: 20,),
                Row(
                 children: <Widget>[
                     Expanded(
                    child: Container(
                      margin:const EdgeInsets.only(left: 10,right: 10),
                      child: const Divider(color: Colorz.main,))
                  ),       
                 const Text("Or",style: TextStyle(color: Colorz.textSecondary),),        
                   Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10,right: 10),
                          child: const Divider(color: Colorz.main,))
                     ),
                    ],
                  ),
                 const SizedBox(height: 35,),

                  const InkWell(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                            Icons.ios_share_rounded,
                            color: Colorz.textSecondary,
                            ),
                            SizedBox(width: 8,),
                            Text(
                            'Share Profile Link',
                            style: TextStyle(
                            color: Colorz.textSecondary,
                            fontSize:16
                            ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(TablerIcons.mail,color: Colorz.textSecondary,),
                            SizedBox(width: 8,),
                            Text(
                            'Share Profile Link via Email',
                            style: TextStyle(
                            color: Colorz.textSecondary,
                            fontSize:16
                            ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(TablerIcons.message,color: Colorz.textSecondary,),
                            SizedBox(width: 8,),
                            Text(
                            'Share Profile Link via Message',
                            style: TextStyle(
                            color: Colorz.textSecondary,
                            fontSize:16
                            ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(TablerIcons.device_floppy , color: Colorz.textSecondary,),
                            SizedBox(width: 8,),
                            Text(
                            'Save QR Code to Phone',
                            style: TextStyle(
                            color: Colorz.textSecondary,
                            fontSize:16
                            ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}