import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3243),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff2F3243),
        title: Text("Quizz App", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  "¿Has almorzado hoy?",
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
                  onPressed: () {},
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
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
