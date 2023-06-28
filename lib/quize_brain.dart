import 'question.dart';
class QuizBrain{
  int _questionNumber=0;
  bool end=false;
  late int len;

  List<Question> _questionBank=[
    Question(q: 'HTML tags are case sensitive ?', a: false),
    Question(q:"One of the functions of the 'alt' attribute is to provide information about the image to assistive technologies and search engines.", a: true),
    Question(q: 'Does image tag have a closing tag? ', a: false),
    Question(q: 'You do need a connection to the Internet to test your HTML code.', a: false),
    Question(q: 'You can have multiple header and footer elements in your Web page.', a: true),
    Question(q: 'HTML tags and HTML elements the same thing', a: false),
    Question(q: '<span> should be used anytime you want to make inline changes', a: false),
    Question(q: 'The primary purpose of HTML is to assist formatting of text.', a: false),
    Question(q: "The non-global attribute ‘size’ can only be applied to one tag.", a: false),
    Question(q: "Script kiddies are attackers' whose motivation may be defined as ideological or attacking for the sake of principles or beliefs.", a: false),
    Question(q: 'Security actions that ensure data is accessible to authorised users is known as availability.', a: false),
    Question(q: 'Introduction of BYOD results in organizations facing difficulty to provide security for a wide array of personal devices.', a: true),
    Question(q: 'Session cookie refers to a form of verification used when accessing a secure web application', a: true),
    // // Question(q: '', a: false),
    // Question(q: '', a: false),
    // Question(q: '', a: false),
    // Question(q: '', a: false),
  ];
void nextQuestion(){
  if(_questionNumber < _questionBank.length-1){
    _questionNumber++;
  }
  else{
    end=true;
    _questionNumber=0;
    len=_questionBank.length;
  }
}

  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

}
