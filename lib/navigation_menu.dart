import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:taptrend/home_screen.dart';
import 'package:taptrend/utils/colorz.dart';

import 'connection_screen.dart';
import 'insights_screen.dart';
import 'share_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  static const routeName = '/navigation-menu';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colorz.appBar,
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          indicatorColor: Colors.transparent
          ,
          onDestinationSelected: (index) => controller.selectedIndex.value = index ,
          destinations:const [
            NavigationDestination(
              icon:Icon(
              TablerIcons.home,color: Colorz.textSecondary,), 
              selectedIcon: Icon(TablerIcons.home,color: Colorz.textPrimary,),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
              Icons.people_alt_rounded,color:Colorz.textSecondary ), 
              selectedIcon: Icon(Icons.people_alt_rounded,color: Colorz.textPrimary,),
              label: 'Connections',
            ),
            NavigationDestination(
              icon: Icon(
              TablerIcons.share,color:Colorz.textSecondary ), 
              selectedIcon: Icon(TablerIcons.share,color: Colorz.textPrimary,),
              label: 'Share',
            ),
            NavigationDestination(
              icon: Icon(
              TablerIcons.align_box_bottom_left,color:Colorz.textSecondary ), 
              selectedIcon: Icon(TablerIcons.align_box_bottom_left,color: Colorz.textPrimary,),
              label: 'Insights',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      );
  }
}
class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const ConnectionsScreen(),
    const ShareScreen(),
    const InsightScreen(),
  ];
}