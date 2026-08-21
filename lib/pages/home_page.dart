import 'package:flutter/material.dart';
import 'package:quizappg16/quizbrain.dart';
import 'package:quizappg16/widgets/header.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Quizbrain quizbrain = Quizbrain();

  void checkAnswer(bool userAnwer) {
    bool correctAnswer = quizbrain.getQuestionAnswer();
    if (userAnwer == correctAnswer) {
      print("verdadderoo");
    } else {
      print("La respuesta esta mal");
    }

    if (quizbrain.isFinishedFunc()) {
      print("El cuestionario ha terminado");
      showDialog(
        context: context,
        barrierDismissible: false, //no cerrar tocando fuera del modal
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.warning, color: Colors.orange),
                Text("Alerta"),
              ],
            ),
            content: Text("Has llegado al final del cuestionario"),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                onPressed: () {
                  quizbrain.restartQuizz();
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    } else {
      quizbrain.nextQuestion();
    }

    setState(() {});
  }

  // Widget buildHeader() {
  //   return Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.all(24),
  //     color: Colors.blue,
  //     child: Row(
  //       mainAxisAlignment: .spaceBetween,
  //       children: [
  //         CircleAvatar(
  //           radius: 30,
  //           backgroundColor: Colors.red,
  //           backgroundImage: NetworkImage(
  //             "https://images.pexels.com/photos/9077998/pexels-photo-9077998.jpeg",
  //           ),
  //         ),
  //         Column(
  //           crossAxisAlignment: .start,
  //           children: [
  //             Text(
  //               "Hola Jhonny",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 28,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 8),
  //             Text(
  //               "Bienvenido al cuestionario",
  //               style: TextStyle(fontSize: 16, color: Colors.white70),
  //             ),
  //           ],
  //         ),
  //         IconButton(
  //           onPressed: () {},
  //           icon: Icon(Icons.notifications, color: Colors.white),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3243),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Color(0xff2F3243),
      //   title: Text("Quizz App", style: TextStyle(color: Colors.white)),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // buildHeader(),
            Header(),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizbrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: MaterialButton(
                  color: Colors.greenAccent,
                  minWidth: double.infinity,
                  child: Text("Verdadero"),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: MaterialButton(
                  color: Colors.redAccent,
                  minWidth: double.infinity,
                  child: Text("Falso"),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
