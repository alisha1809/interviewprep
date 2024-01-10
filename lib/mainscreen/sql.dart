import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(InterviewPreparationApp3());
}

class InterviewPreparationApp3 extends StatefulWidget {
  @override
  State<InterviewPreparationApp3> createState() => _InterviewPreparationAppState();
}

class _InterviewPreparationAppState extends State<InterviewPreparationApp3> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<InterviewItem> _interviewItems = [
    InterviewItem(
      question: 'What is SQL?',
      answer: 'SQL stands for Structured Query Language. It is a domain-specific language used to manage and manipulate relational databases',
      audioPath: 'assets/audio/sql1.mp3',
    ),
     InterviewItem(
      question: 'What is a Database?',
      answer: 'A database is a structured collection of data organized in a way that a computer program can quickly access and manipulate it. It consists of tables to hold data and relationships between these tables.',
      audioPath: 'assets/audio/sql2.mp3',
    ),
     InterviewItem(
      question: 'What is a DBMS?',
      answer: ' Database Management System (DBMS) is software that enables users to interact with databases. It provides an interface to perform various operations such as storing, retrieving, updating, and managing data in a database',
      audioPath: 'assets/audio/sql3.mp3',
    ),
    InterviewItem(
      question: 'What is a Primary Key?',
      answer: ' A Primary Key is a unique identifier for a record in a table. It ensures that each row in a table is uniquely identifiable. Primary keys must contain unique values and cannot have NULL values.',
      audioPath: 'assets/audio/sql4.mp3',
    ),
    InterviewItem(
      question: 'What is a Foreign Key?',
      answer: 'A Foreign Key is a field in a database table that is used to establish a link between two tables. It creates a relationship between the data in two tables and ensures referential integrity between them.',
      audioPath: 'assets/audio/sql5.mp3',
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
