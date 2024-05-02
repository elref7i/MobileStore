import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [
          Spacer(
            flex: 1,
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.yellow,
            child: CircleAvatar(
              radius: 57,
              backgroundImage: AssetImage("images/phone.jpg"),
            ),
          ),
          Text(
            'E_Commerce',
            style: TextStyle(
              fontFamily: "Pacifico",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      
    );
  }
}
