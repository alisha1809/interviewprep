import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(InterviewPreparationApp1());
}

class InterviewPreparationApp1 extends StatefulWidget {
  @override
  State<InterviewPreparationApp1> createState() => _InterviewPreparationAppState();
}

class _InterviewPreparationAppState extends State<InterviewPreparationApp1> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<InterviewItem> _interviewItems = [
    InterviewItem(
      question: 'What is Java?',
      answer: 'Java is a high-level, object-oriented programming language. It is designed to be platform-independent.',
      audioPath: 'assets/audio/java1.mp3',
    ),
      InterviewItem(
      question: 'What are the four principles of Object-Oriented Programming?',
      answer: 'Encapsulation,Polymorphism,Abstraction,Inheritance are the four principles of Object-Oriented Programming.',
      audioPath: 'assets/audio/java2.mp3',
    ),
    InterviewItem(
      question: 'What is a Java Interface?',
      answer: 'An interface in Java is a collection of abstract methods. Any class that implements an interface must provide concrete implementations for all of its methods.',
      audioPath: 'assets/audio/java3.mp3',
    ),
    InterviewItem(
      question: 'Explain Exception Handling in Java?',
      answer: 'Exceptions are objects representing errors that can occur during the execution of a program.',
      audioPath: 'assets/audio/java4.mp3',
    ),// Add more InterviewItems as needed
  ];

  late InterviewItem _currentInterviewItem;

  @override
  void initState() {
    super.initState();
    _currentInterviewItem = _interviewItems.first;
  }

  @override
  void dispose() {
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
                    .map(
                      (interviewItem) => ListTile(
                        title: Text(interviewItem.question),
                        onTap: () {
                          setState(() {
                            _currentInterviewItem = interviewItem;
                          });
                        },
                      ),
                    )
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
