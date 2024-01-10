import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(InterviewPreparationApp2());
}

class InterviewPreparationApp2 extends StatefulWidget {
  @override
  State<InterviewPreparationApp2> createState() => _InterviewPreparationAppState();
}

class _InterviewPreparationAppState extends State<InterviewPreparationApp2> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<InterviewItem> _interviewItems = [
    InterviewItem(
      question: 'What is Python?',
      answer: 'Python is a high-level, interpreted programming language.',
      audioPath: 'assets/audio/python1.mp3',
    ),
      InterviewItem(
      question: 'What are Python data types?',
      answer: 'Python supports various data types, including integers, floats, strings, lists, tuples, dictionaries, and booleans. These data types can store values and are used for different purposes in programming.',
      audioPath: 'assets/audio/python2.mp3',
    ),
    InterviewItem(
      question: 'How do you create a function in Python?',
      answer: 'Functions in Python are defined using the def keyword, followed by the function name, parameters, and a colon. The function body is indented.',
      audioPath: 'assets/audio/python3.mp3',
    ),
    InterviewItem(
      question: 'What is a lambda function?',
      answer: 'A lambda function, also known as an anonymous function, is a small, unnamed function defined using the lambda keyword',
      audioPath: 'assets/audio/python4.mp3',
    ),
    InterviewItem(
      question: 'What is Python garbage collection?',
      answer: 'Python uses automatic memory management via garbage collection here objects are automatically deallocated when they are no longer in use, and their memory is returned to the system. ',
      audioPath: 'assets/audio/python5.mp3',
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
