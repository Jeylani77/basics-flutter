import 'package:flutter/material.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({Key? key}) : super(key: key);

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int currentQuestion = 0;
  int score = 0;
  var quizz = [
    {
      "title": "What is the capital of Senegal ?",
      "answers": [
        {"answer": "Abdjan", "correct": false},
        {"answer": "Dakar", "correct": true},
        {"answer": "Saint Louis", "correct": false},
      ]
    },
    {
      "title":
          "Quel Sénégalais a remporté deux fois le ballon d'or Africain ? ",
      "answers": [
        {"answer": "El Hadj Diouf", "correct": true},
        {"answer": "Eto'o Fils", "correct": false},
        {"answer": "Sadio Mané", "correct": false},
      ]
    },
    {
      "title": "Which Senegalese has won the African Golden Ball twice ?",
      "answers": [
        {"answer": "Thiébou djeun", "correct": true},
        {"answer": "Mafé", "correct": false},
        {"answer": "Domoda", "correct": false},
      ]
    },
    {
      "title": "Who is the current president of Senegal ?",
      "answers": [
        {"answer": "Emanuel Macron", "correct": false},
        {"answer": "Ousmane Sonko", "correct": false},
        {"answer": "Macky Sall", "correct": true},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quizz'),
        ),
        body: (currentQuestion >= quizz.length)
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Score : ${(100 * score / quizz.length).round()} %',
                      style: TextStyle(fontSize: 22),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            score = 0;
                            currentQuestion = 0;
                          });
                        },
                        child: Text(
                          'Restart',
                          style: TextStyle(fontSize: 22),
                        ))
                  ],
                ),
              )
            : ListView(
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                        'Question ${currentQuestion + 1} / ${quizz.length}',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${quizz[currentQuestion]['title']}',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ...(quizz[currentQuestion]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (answer['correct'] == true) score++;
                            ++currentQuestion;
                          });
                        },
                        child: Text(
                          '${answer['answer']}',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    );
                  })
                ],
              ));
  }
}
