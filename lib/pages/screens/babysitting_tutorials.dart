import 'package:flutter/material.dart';

class BabysittingAptitudeTest extends StatefulWidget {
  const BabysittingAptitudeTest({Key? key}) : super(key: key);

  @override
  _BabysittingAptitudeTestState createState() =>
      _BabysittingAptitudeTestState();
}

class _BabysittingAptitudeTestState extends State<BabysittingAptitudeTest> {
  List<String> questions = [
    'What is the most common choking hazard for young children?',
    'How do you handle a child who is refusing to go to bed?',
    'Why is it important to childproof the environment?',
    'How can you ensure a safe play area for children?',
    'What should you do if a child gets a minor cut or scrape?',
    'What is the appropriate way to hold a newborn baby?',
    'How do you handle a child who is throwing a temper tantrum?',
    'Why is it important to wash hands regularly when caring for infants?',
    'What safety measures should be taken during outdoor play?',
    'What is the recommended sleep duration for toddlers?',
  ];

  List<List<String>> options = [
    ['A. Small toys', 'B. Fruits', 'C. Blankets'],
    [
      'A. Let them stay awake',
      'B. Use bribery',
      'C. Establish a bedtime routine'
    ],
    [
      'A. It is not important',
      'B. To promote curiosity',
      'C. To prevent accidents'
    ],
    [
      'A. Use bubble wrap on the floor',
      'B. Provide small toys with detachable parts',
      'C. Remove sharp objects and use soft padding',
    ],
    [
      'A. Apply alcohol or vinegar',
      'B. Wash the area with soap and water',
      'C. Ignore it, as it is a minor injury',
    ],
    [
      'A. Hold the baby with one hand under the head and the other under the bottom',
      'B. Hold the baby with one hand under the bottom and the other supporting the back',
      'C. Hold the baby with both hands under the arms',
    ],
    [
      'A. Give in to their demands',
      'B. Ignore the tantrum and walk away',
      'C. Comfort them and offer alternatives',
    ],
    [
      'A. To prevent infant acne',
      'B. To avoid smelling like baby formula',
      'C. To reduce the risk of infection',
    ],
    [
      'A. No safety measures are needed',
      'B. Use sunscreen and provide shade',
      'C. Allow children to play without supervision',
    ],
    [
      'A. 8-10 hours',
      'B. 12-14 hours',
      'C. 5-7 hours',
    ],
  ];

  List<String> correctAnswers = [
    'A. Small toys',
    'C. Establish a bedtime routine',
    'C. To prevent accidents',
    'C. Remove sharp objects and use soft padding',
    'B. Wash the area with soap and water',
    'A. Hold the baby with one hand under the head and the other under the bottom',
    'C. Comfort them and offer alternatives',
    'C. To reduce the risk of infection',
    'B. Use sunscreen and provide shade',
    'A. 8-10 hours',
  ];

  int currentQuestionIndex = 0;
  String selectedAnswer = '';
  int correctAnswersCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Babysitting Aptitude Test'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question ${currentQuestionIndex + 1} of ${questions.length}:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                questions[currentQuestionIndex],
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: options[currentQuestionIndex]
                    .map((option) => RadioListTile(
                          title: Text(option),
                          value: option,
                          groupValue: selectedAnswer,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswer = value as String;
                            });
                          },
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check the answer and move to the next question
                  checkAnswer();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF6F61), // Coral pink color
                ),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkAnswer() {
    // Check if the selected answer is correct
    bool isCorrect = selectedAnswer == correctAnswers[currentQuestionIndex];

    // Update the correct answers count
    if (isCorrect) {
      correctAnswersCount++;
    }

    // Move to the next question or finish the quiz
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = '';
      });
    } else {
      // Show the final result
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Quiz Results'),
          content: Text(
              'You answered $correctAnswersCount out of ${questions.length} questions correctly.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // You can navigate to the result page or perform any other action here
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                // Reset the quiz and retake
                resetQuiz();
              },
              child: Text('Retake'),
            ),
          ],
        ),
      );
    }
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswer = '';
      correctAnswersCount = 0;
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: BabysittingAptitudeTest(),
  ));
}
