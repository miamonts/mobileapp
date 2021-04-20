import 'package:flutter/material.dart';
import 'main.dart';
import 'quizpage.dart';

MathQuiz quiz = MathQuiz();

class TotalScore extends StatefulWidget {
  final String username;
  final String password;
  final String finalscore;
  TotalScore({Key key, @required this.finalscore, this.username, this.password})
      : super(key: key);

  @override
  _TotalScoreState createState() =>
      _TotalScoreState(username, finalscore, password);
}

class _TotalScoreState extends State<TotalScore> {
  get totalScore => quiz.questions.length;
  final String username;
  final String password;
  final String finalscore;
  _TotalScoreState(this.username, this.finalscore, this.password);

  @override
  void initState() {
    print(username);
    print(password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.orange[300],
              Colors.orange[200],
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Total Score of $username: $finalScore out of $totalScore",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.all(30.0)),
              //retake quiz
              GestureDetector(
                onTap: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Math(
                                username: username,
                                finalscore: finalscore,
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange,
                  ),
                  child: Text(
                    "Retake Quiz",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  questionNumber = 0;
                  finalScore = 0;
                  //signup(username, password);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange,
                  ),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
