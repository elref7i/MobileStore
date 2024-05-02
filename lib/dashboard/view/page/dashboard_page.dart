import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/dashboard/controller/cubit/dashboard_cubit.dart';
import 'package:mobile_app/dashboard/modules/Home/view/home_page.dart';
import 'package:mobile_app/utils/colors/colors_constant.dart';
import 'package:mobile_app/dashboard/modules/products/view/page/Product_page.dart';

import '../../modules/users/view/page/Product_page.dart';

class DashboardPage extends StatelessWidget {
  final List<String> titles = const ['Home', 'Products', 'Services'];
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardController(),
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          DashboardController controller = context.read<DashboardController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ccolor.gray,
              title: Text(titles[controller.selectedTapIndex]),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'registration');
                    },
                    icon: Icon(CupertinoIcons.add))
              ],
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTabIndex,
              children: const [
                HomeScreen(),
                ProductPage(),
                Text("Services"),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTabIndex,
              unselectedItemColor: Color.fromARGB(255, 62, 8, 47),
              showSelectedLabels: true,
              unselectedLabelStyle:
                  const TextStyle(fontSize: 15, color: Colors.pinkAccent),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: "Product"),
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
