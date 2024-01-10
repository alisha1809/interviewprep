import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './login1.dart';
import 'package:interviewprep/mainscreen/home1screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InterviewPrep App"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  _boxLogin.clear();
                  _boxLogin.put("loginStatus", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome!!!",
              style:TextStyle(fontSize: 30)
            ),
            const SizedBox(height: 10),
            Text(
              _boxLogin.get("userName"),
              style: TextStyle(fontSize: 35)
            ),
            const SizedBox(
                height: 20), // Add some space between the text and the button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguageSelectionPage()),
                );
                // Handle button press
                // You can navigate to another page or perform any action here
              },
              child: Text("Start Prep"),
            
            )
          ],
        ),
      ),
    );
  }
}
