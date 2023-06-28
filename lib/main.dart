import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quize_brain.dart';

QuizBrain quizBrain = QuizBrain();


void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF041562),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizePage(),
          ),
        ),
      ),
    );
  }
}

class QuizePage extends StatefulWidget {
  const QuizePage({Key? key}) : super(key: key);

  @override
  State<QuizePage> createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  int correct=0;
  List <Icon>scoreKeeper=[];

void checking(bool userPickedanswer){
  bool correctanswer = quizBrain.getQuestionAnswer();
  bool end= quizBrain.end;


  setState(() {

    if(end==true){
      Alert(
        context: context,
        title: "Quiz Over",
        desc: "You have completed the quiz. you got $correct correct answers.",
      ).show();
      scoreKeeper.clear();
      quizBrain.getQuestionText();
      quizBrain.end=false;
      correct=0;
    }

    else {

      if (userPickedanswer == correctanswer) {
        correct++;
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,

          ),
        );
      }
      else {

        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      quizBrain.nextQuestion();
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Padding(

            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Color(0xFF041562),
              child: Center(

                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                    fontWeight: FontWeight.bold


                ),),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,


                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 18.0),
                  color: Colors.blue[900],
                    child: TextButton(
                      onPressed:(){

                         checking(true);

                      },
                      child: Text('Yes',
                      style: TextStyle(
                        fontSize: 28.0,

                        color: Colors.white,
                      ),),
                    ),
                ),
              ),

SizedBox(
  height: 10.0,
),
        Expanded(
          flex: 1,
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 20.0 ,horizontal: 18.0),
            color: Colors.red,
            child: TextButton(
              onPressed:(){
                checking(false);
              },
              child: Text('No',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                ),),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:scoreKeeper,


          ),
        )
      ],
    );
  }
}


