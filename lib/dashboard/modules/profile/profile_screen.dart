import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard/modules/profile/Setting.dart';
import 'package:mobile_app/dashboard/modules/profile/my_account.dart';
import 'package:mobile_app/dashboard/modules/profile/help.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Omar .."),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User_Icon.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyAccountScreen()),
                );
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question_mark.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HelpCenterScreen()),
                );
              },
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log_out.svg",
              press: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
