import 'package:code_test/main.dart';
import 'package:code_test/problem_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(top: 24, left: 20),
            child: Icon(
              CupertinoIcons.doc_text,
              color: Colors.white,
              size: 35,
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 30, left: 10),
            child: Text(
              "Problem Statements",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xffEF5350), Color(0xffD64CD2)]),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProblemContainer(
              imagePath: 'assets/images/problem1.png',
              title: 'Problem 1',
              description: 'Write a program to find prime number',
              gradientColors: [Colors.blue.shade200, Colors.blue.shade500],
              context: context,
              arrowColor: Colors.blueAccent,
            ),
            buildProblemContainer(
              imagePath: 'assets/images/problem2.png',
              title: 'Problem 2',
              description: 'Write a program for binary search',
              gradientColors: [
                Colors.greenAccent.shade200,
                Colors.greenAccent.shade700
              ],
              context: context,
              arrowColor: Colors.green.shade500,
            ),
            buildProblemContainer(
              imagePath: 'assets/images/problem3.png',
              title: 'Problem 3',
              description: 'Write a program for linear search',
              gradientColors: [Colors.orange.shade200, Colors.orange.shade700],
              context: context,
              arrowColor: Colors.orange.shade500,
            ),
            buildProblemContainer(
              imagePath: 'assets/images/problem4.png',
              title: 'Problem 4',
              description: 'Write a program for bubble sort',
              gradientColors: [
                Colors.purpleAccent.shade100,
                Colors.purpleAccent.shade700
              ],
              context: context,
              arrowColor: Colors.purple.shade400,
            ),
            buildProblemContainer(
              imagePath: 'assets/images/problem5.png',
              title: 'Problem 5',
              description: 'Write a program for quick sort',
              gradientColors: [
                Colors.tealAccent.shade200,
                Colors.tealAccent.shade700
              ],
              context: context,
              arrowColor: Colors.teal.shade400,
            ),
            buildProblemContainer(
              imagePath: 'assets/images/problem6.png',
              title: 'Problem 6',
              description: 'Write a program for fibonacci series',
              gradientColors: [Colors.yellow.shade700, Colors.redAccent],
              context: context,
              arrowColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
