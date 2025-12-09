import 'package:flutter/material.dart';

void main() {
  runApp(const MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  const MyQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Java & Spring Quiz',
      debugShowCheckedModeBanner: false,
      home: const QuizzPage(title: "Java & Spring Quiz"),
    );
  }
}

class Question {
  String questionText;
  bool isCorrect;

  Question({required this.questionText, required this.isCorrect});
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key, required this.title});
  final String title;

  @override
  State<QuizzPage> createState() => SomeQuizzPageState();
}

class SomeQuizzPageState extends State<QuizzPage> {
  int questionIndex = 0;

  final List<Question> questions = [
    Question(
      questionText:
          "Spring Boot utilise des starters pour simplifier la configuration.",
      isCorrect: true,
    ),
    Question(
      questionText:
          "En Java, une interface peut contenir des méthodes avec un corps (default methods).",
      isCorrect: true,
    ),
    Question(
      questionText:
          "@Autowired permet d'injecter manuellement les dépendances.",
      isCorrect: false,
    ),
    Question(
      questionText: "La JVM exécute directement le code source Java.",
      isCorrect: false,
    ),
    Question(
      questionText: "@RestController combine @Controller et @ResponseBody.",
      isCorrect: true,
    ),
  ];

  void _checkAnswer(bool userChoice) {
    bool correctAnswer = questions[questionIndex].isCorrect;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          correctAnswer == userChoice ? "Correct !" : "Incorrect",
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: correctAnswer == userChoice
            ? Colors.green
            : Colors.red,
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF1),

      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0D47A1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(3, 5),
                color: Colors.black26,
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Question ${questionIndex + 1} / ${questions.length}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0D47A1),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                questions[questionIndex].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFDAFFBD),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _checkAnswer(true),
                    child: const Text("VRAI"),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFFFFAEA1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _checkAnswer(false),
                    child: const Text("FAUX"),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // NEXT BUTTON
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _nextQuestion,
                child: const Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
