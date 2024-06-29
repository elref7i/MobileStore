// help_center_screen.dart
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  static String routeName = "/help_center";

  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "How can we help you?",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text("Frequently Asked Questions"),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
            ListTile(
              leading: Icon(Icons.support),
              title: Text("Customer Support"),
              onTap: () {
                // Navigate to Customer Support page
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              onTap: () {
                // Navigate to About Us page
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact Us"),
              onTap: () {
                // Navigate to Contact Us page
              },
            ),
            // Add more ListTile widgets as needed for different help topics
          ],
        ),
      ),
    );
  }
}
