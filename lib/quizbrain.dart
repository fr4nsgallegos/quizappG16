import 'package:quizappg16/models/question_model.dart';

class Quizbrain {
  int questionIndex = 0;
  bool isFinished = false;

  List<QuestionModel> questionList = [
    QuestionModel(question: "¿El hombre llegó a la luna?", answer: true),
    QuestionModel(question: "¿Has cenado hoy?", answer: true),
    QuestionModel(question: "¿Saliste ayer?", answer: false),
    QuestionModel(question: "¿Has desayunado?", answer: true),
    QuestionModel(question: "El sol es una estrella", answer: true),
    QuestionModel(question: "¿Sientes Frio?", answer: false),
    QuestionModel(question: "¿Flutter usa Dart?", answer: true),
  ];

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    } else {
      isFinished = true;
      print("Se acabaron las preuntas");
    }
  }

  bool isFinishedFunc() {
    return isFinished;
  }

  void restartQuizz() {
    questionIndex = 0;
    isFinished = false;
  }
}
