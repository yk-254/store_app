
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:store_app/app/data/models/vars.dart';
import 'package:store_app/public/theme/theme.dart';


class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) =>
            Obx(() => pages.elementAt(pagesIndex.value)),
      ),
      floatingActionButton: Obx(() => FloatingActionButton(
            backgroundColor: pagesIndex.value == 2
                ? themeVar.colorScheme.primary
                : themeVar.colorScheme.secondary,
            child: Icon(Icons.home),
            onPressed: () {
              pagesIndex.value = 2;
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
        
            icons: [
              Icons.person,
              Icons.shopping_basket,
            ],
            
            activeColor: themeVar.colorScheme.primary,
            inactiveColor: themeVar.colorScheme.secondary,
            activeIndex: pagesIndex.value,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            onTap: (p0) {
              pagesIndex.value = p0;
            },
          )),
    );
  }
}
