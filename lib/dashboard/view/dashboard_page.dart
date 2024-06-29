import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core/cubit/parent_cubit.dart';
import 'package:mobile_app/core/utils/context_extention.dart';
import 'package:mobile_app/dashboard/controller/cubit/dashboard_cubit.dart';
import 'package:mobile_app/dashboard/modules/Cart/View/cart_page.dart';
import 'package:mobile_app/dashboard/modules/Fav/View/fav_page.dart';
import 'package:mobile_app/dashboard/modules/Home/view/home_page.dart';
import 'package:mobile_app/dashboard/modules/profile/profile_screen.dart';
import 'package:mobile_app/dashboard/modules/users/view/page/Product_page.dart';
import 'package:mobile_app/utils/colors/colors_constant.dart';
import 'package:badges/badges.dart' as badges;

class DashboardPage extends StatelessWidget {
  final List<String> titles = [
    'home_page_tittle'.tr,
    "item_page_title".tr,
    "cart_page_title".tr,
    "fav".tr,
    "Profile",
  ];
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardController(),
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          DashboardController controller = context.read<DashboardController>();
          final themeMode = ParentCubit.instance.themeMode;
          final langg = ParentCubit.instance.lang;
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              title: Text(
                titles[controller.selectedTapIndex],
                style: Theme.of(context).textTheme.displayLarge,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 10.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          ParentCubit.instance.chageMode();
                        },
                        icon: Icon(
                          themeMode == ThemeMode.dark
                              ? Icons.wb_sunny
                              : Icons.nights_stay,
                          color: themeMode == ThemeMode.dark
                              ? Colors.amber
                              : const Color.fromARGB(255, 0, 53, 96),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ParentCubit.instance.changeLang();
                        },
                        icon: Icon(
                          Icons.language_outlined,
                          color: langg == "ar"
                              ? Color.fromARGB(255, 2, 105, 89)
                              : const Color.fromARGB(255, 1, 57, 104),
                        ),
                        tooltip: langg == "ar" ? 'en' : 'ar',
                      ),
                      badges.Badge(
                        badgeContent: Text(
                          '5',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        position: badges.BadgePosition.topEnd(
                            top: -6, end: -6), // Adjusted position
                        child: IconButton(
                          onPressed: () {
                            controller.onChangeTabIndex(2);
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Color.fromARGB(255, 116, 90, 227),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTabIndex,
              children: [
                HomeScreen(),
                ProductPage(),
                CartScreen(),
                FavScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTabIndex,
              unselectedItemColor: Color.fromARGB(255, 8, 103, 159),
              backgroundColor: ccolor.gray2,
              fixedColor: Color.fromARGB(255, 144, 134, 141),
              showSelectedLabels: true,
              unselectedLabelStyle: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 211, 18, 18)),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home),
                    label: "home_page_tittle".tr),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.collections),
                    label: "item_page_title".tr),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart),
                    label: "cart_page_title".tr),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: "Fav".tr,
                ),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person), label: "User"),
              ],
            ),
          );
        },
      ),
    );
  }
}
