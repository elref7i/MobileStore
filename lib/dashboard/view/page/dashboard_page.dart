import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core/cubit/parent_cubit.dart';
import 'package:mobile_app/core/utils/context_extention.dart';
import 'package:mobile_app/dashboard/controller/cubit/dashboard_cubit.dart';
import 'package:mobile_app/dashboard/modules/Cart/View/cart_page.dart';
import 'package:mobile_app/dashboard/modules/Home/view/home_page.dart';
import 'package:mobile_app/dashboard/modules/users/profile/profile_screen.dart';
import 'package:mobile_app/utils/colors/colors_constant.dart';
import '../../modules/users/view/page/Product_page.dart';
import 'package:badges/badges.dart' as badges;

class DashboardPage extends StatelessWidget {
  final List<String> titles =  [
    'home_page_tittle'.tr,
    "item_page_title".tr,
    "cart_page_title".tr,
    'Profile'
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
          final langg= ParentCubit.instance.lang;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ccolor.gray2,
              title: Text(
                titles[controller.selectedTapIndex],
                style: Theme.of(context).textTheme.displayLarge,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    ParentCubit.instance.chageMode();
                  },
                  icon: Icon(
                  themeMode == ThemeMode.dark ? Icons.wb_sunny : Icons.nights_stay,
                  color: themeMode == ThemeMode.dark ? Colors.amber : Colors.blue,
                ),
                ),
                IconButton(
                onPressed: () {
                  ParentCubit.instance.changeLang();
                },
                icon: Icon(
                  Icons.language_outlined , // يمكنك استخدام أيقونة أخرى إن أردت
                  color: langg=="ar" ? Color.fromARGB(255, 98, 100, 212) : Colors.blue,
                ),
                tooltip: langg=="ar" ? 'ar' : 'en',
                ),
                badges.Badge(
                  badgeContent: Text(
                    '4',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  position: badges.BadgePosition.topEnd(top: 30, end: 30),
                  child: IconButton(
                    onPressed: () {
                      controller.onChangeTabIndex(2);
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color.fromARGB(255, 14, 99, 120),
                    ),
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
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTabIndex,
              unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
              backgroundColor: ccolor.gray2,
              fixedColor: Color.fromARGB(255, 6, 152, 188),
              showSelectedLabels: true,
              unselectedLabelStyle: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 211, 18, 18)),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: "Cart"),
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
