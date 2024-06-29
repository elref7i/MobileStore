// settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";

  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle("Account"),
            buildAccountInfoField("Full Name", "Hanona", Icons.person),
            buildAccountInfoField("Email", "hanona@example.com", Icons.email),
            buildAccountInfoField("Phone Number", "+1234567890", Icons.phone),
            const SizedBox(height: 20),
            buildSectionTitle("Preferences"),
            SwitchListTile(
              title: Text("Enable Notifications"),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
              onTap: () {
                // Navigate to Change Password page
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Language"),
              onTap: () {
                // Navigate to Language Selection page
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Function to save changes
                },
                child: Text("Save Changes"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget buildAccountInfoField(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: value,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
