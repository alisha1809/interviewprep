import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(InterviewPreparationApp());
}

class InterviewPreparationApp extends StatefulWidget {
  @override
  State<InterviewPreparationApp> createState() => _InterviewPreparationAppState();
}

class _InterviewPreparationAppState extends State<InterviewPreparationApp> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<InterviewItem> _interviewItems = [
    InterviewItem(
      question: 'What is Flutter?',
      answer: 'Flutter is a UI toolkit by Google.',
      audioPath: 'assets/audio/flutter.mp3',
    ),
     InterviewItem(
      question: 'Explain Hot Reload in Flutter?',
      answer: 'Hot Reload is a feature in Flutter that allows developers to see the changes they made in the code immediately in the app without losing the app state. It helps in experimenting, building UIs, adding features, and fixing bugs faster by reloading the changed files while the app is running.',
      audioPath: 'assets/audio/flutter2.mp3',
    ),
     InterviewItem(
      question: 'Explain the Difference Between Stateless and Stateful Widgets in Flutter?',
      answer: 'Stateless Widgets: These widgets are immutable and cannot change over time.Stateful Widgets: These widgets can change dynamically',
      audioPath: 'assets/audio/flutter3.mp3',
    ),
    InterviewItem(
      question: 'What is the BuildContext in Flutter?',
      answer: 'BuildContext  is an object that points to the location of a widget within the widget tree. Its required for many operations in Flutter, such as navigating to a new screen or showing a dialog box.',
      audioPath: 'assets/audio/flutter4.mp3',
    ),
    InterviewItem(
      question: 'What is a Scaffold Widget?',
      answer: 'Scaffold is a basic skeletal structure in Flutter apps. It provides support for the AppBar, BottomNavigationBar, floating action button, and many other basic material design elements.',
      audioPath: 'assets/audio/flutter5.mp3',
    ),
     // Add more InterviewItems as needed
  ];

  // Initialize _currentInterviewItem with the first item in the list
  late InterviewItem _currentInterviewItem;

  @override
  void initState() {
    super.initState();
    _currentInterviewItem = _interviewItems.first;
  }

  @override
  void dispose() {
    // Release the AudioPlayer object
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        appBar: AppBar(
          title: Text('Interview Preparation App'),
          backgroundColor: Color.fromRGBO(32, 63, 129, 1.0),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: _interviewItems
                    .map((interviewItem) => ListTile(
                          title: Text(interviewItem.question),
                          onTap: () {
                            setState(() {
                              _currentInterviewItem = interviewItem;
                            });
                          },
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Answer: ${_currentInterviewItem.answer}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () async {
                      await _audioPlayer.play(_currentInterviewItem.audioPath);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.pause),
                    onPressed: () async {
                      await _audioPlayer.pause();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: () async {
                      await _audioPlayer.stop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InterviewItem {
  final String question;
  final String answer;
  final String audioPath;

  InterviewItem({
    required this.question,
    required this.answer,
    required this.audioPath,
  });
}
