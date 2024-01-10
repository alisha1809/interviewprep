import 'package:flutter/material.dart';
import './qnascreen.dart';
import './javascreen.dart';
import './pythonscreen.dart';
import './sql.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Language'),
        backgroundColor: Color.fromRGBO(32, 63, 129, 1.0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterviewPreparationApp()),
                );
              },
              child: Text('Flutter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterviewPreparationApp1()),
                );
              },
              child: Text('Java'),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterviewPreparationApp2()),
                );
              },
              child: Text('Python'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterviewPreparationApp3()),
                );
              },
              child: Text('SQL'),
            ),// Add more buttons for other languages as needed
          ],
        ),
      ),
    );
  }
}
