import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:taptrend/utils/helper.dart';
import 'package:taptrend/widget/nfc_controller.dart';
import 'package:taptrend/widget/qr_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
static const routeName = '/thired';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){

Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => QrScreens(
                          getUrl: (url) async {
                            if (url.contains("profile.taptrend")) {
                              bool isAvailable =
                          await NfcManager.instance.isAvailable();
                      if (isAvailable && mounted) {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => NfcController(
                              url: Uri.parse(url),
                                  getUrl: (url) {
                                    if (url.contains("profile.taptrend")) {


                                      
                                    } else {
                                      if (context.mounted) {
                                        if (mounted) {
                                          Helper.showSnackBar(
                                              context: context,
                                              text: "nvalid NFC card");
                                        }
                                      }
                                    }
                                  },
                                ),
                            backgroundColor: Colors.transparent);
                      } else {
                        if (mounted) {
                          Helper.showSnackBar(
                              context: context,
                              text:
                                  "This device does not support or disabled NFC");
                        }
                      }
                              
                            } else {
                              if (context.mounted) {
                                if (mounted) {
                                  Helper.showSnackBar(
                                      context: context, text: "Invalid QR");
                                }
                              }
                            }
                          },
                        ),
                      ));


              }, 
            child: Text('Scan QR',style: TextStyle(fontSize: 25),),
            )
          ],
        ),
      ),
    );
  }
}