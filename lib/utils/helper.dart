import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptrend/login_page.dart';


import 'colorz.dart';

class Helper {
  static bool _isLoading = false;

  static showLoading({
    required BuildContext context,
  }) {
    _isLoading = true;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const PopScope(
          canPop: false,
          child: Center(
            child: CircularProgressIndicator(
              color: Colorz.main,
            ),
          ),
        );
      },
    );
  }

  static isLoading() {
    return _isLoading;
  }

  static hideLoading({
    required BuildContext context,
  }) {
    if (_isLoading) {
      Navigator.pop(context);
    }
  }

  static showSnackBar({
    required BuildContext context,
    required String text,
    int duration = 5,
    Color color = Colors.red,
  }) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: duration),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<T?> showCustomModalSheet<T>({
    required BuildContext context,
    List<Widget>? children,
  }) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return IntrinsicHeight(
          child: Container(
            width: MediaQuery.of(context).size.width,
            // padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                tileMode: TileMode.clamp,
                colors: [
                  Colorz.insightBoxGradient1,
                  Colorz.insightBoxGradient2,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children ?? [],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<T?> showCustomDialog<T>({
    required BuildContext context,
    IconData? icon,
    Widget? iconChild,
    String? title,
    List<Widget>? children,
    Widget? action,
    bool? isHideCloseButton,
    Function? closeButton,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final Size displaySize = MediaQuery.of(context).size;
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: displaySize.width > 750
                ? displaySize.width * 0.5
                : displaySize.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Colorz.dialogBorder,
              ),
              borderRadius: BorderRadius.circular(30.0),
              gradient: const LinearGradient(
                colors: [
                  Colorz.dialogBackgroundGradientOne,
                  Colorz.dialogBackgroundGradientTwo,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (icon != null)
                            // CustomIcon(
                            //   icon,
                            //   color: Colorz.textPrimary,
                            //   size: 25.0,
                            // ),
                          if (iconChild != null) iconChild,
                          const SizedBox(
                            width: 10.0,
                          ),
                          if (title != null)
                            Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Colorz.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Flexible(
                      //   child: CustomSingleChildScrollView(
                      //     child: Column(
                      //       children: children ?? [],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      if (action != null) action,
                    ],
                  ),
                ),
                // isHideCloseButton == true ? const SizedBox() : Positioned(
                //   top: 12.0,
                //   right: 6.0,
                //   child: CustomCircleIconButton(
                //     icon: TablerIcons.x,
                //     scale: 0.7,
                //     backgroundColor: Colorz.textBlack,
                //     iconColor: Colorz.textPrimary,
                //     onPressed: (){
                //       if(closeButton != null){
                //         closeButton();
                //       } else {
                //         Navigator.of(context).pop();
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
      barrierColor: Colors.black87,
      barrierDismissible: false,
    );
  }

  static logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAll(const LoginScreen());
  }
}
