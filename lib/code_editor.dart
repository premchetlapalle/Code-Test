

import 'package:code_test/home.dart';
import 'package:code_test/main.dart';
import 'package:code_test/stopwatch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/java.dart';

final controller = CodeController(
  text: '''
// Your First Program

class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!"); 
    }
}















''', // Initial code
  language: java,
);

class Code_Editor extends StatefulWidget {
  const Code_Editor({super.key});

  @override
  State<Code_Editor> createState() => _Code_EditorState();
}

class _Code_EditorState extends State<Code_Editor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 22, left: 10),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Home_Screen()),
                );
              },
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 35, left: 10),
            child: Text(
              "Code Editor",
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
            Container(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: const Text(
                'Warning: Plagiarism is a violation of the code of '
                    'conduct and may result in penalties.',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: mq.height* 0.01,),
            Center(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: StopwatchWidget(), // Stopwatch widget here
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          shape: const StadiumBorder(),
                          backgroundColor: const Color(0xffbff4d4d),
                          minimumSize: Size(mq.width * 0.3, mq.height * 0.035)),
                      onPressed: () {
                        // Add code submission functionality here
                        _showSubmissionDialog(context);
                      },
                      child: const Text('Submit',
                          style: TextStyle(fontSize: 19, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.009,
            ),
            Container(
              height: mq.height * 0.7,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(12), // Adjust the radius as needed
                border: Border.all(
                  color: Colors.grey,
                  width: 0, // Border width
                ),
              ),
              child: CodeTheme(
                data: CodeThemeData(styles: monokaiSublimeTheme),
                child: SingleChildScrollView(
                  child: CodeField(
                    controller: controller,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mq.height * 0.03,
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //       elevation: 1,
            //       shape: const StadiumBorder(),
            //       backgroundColor: const Color(0xffbff4d4d),
            //       minimumSize: Size(mq.width * 0.4, mq.height * 0.055)),
            //   onPressed: () {
            //     // Add code submission functionality here
            //     _showSubmissionDialog(context);
            //   },
            //   child: const Text('Submit',
            //       style: TextStyle(fontSize: 20, color: Colors.white)),
            // ),
          ],
        ),
      ),
    );
  }
}

void _showSubmissionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Code Submission'),
        content: const Text('Are you sure you want to submit your code?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Add code submission logic here
              Navigator.pop(context);
              _showSubmissionResultDialog(context);
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}

void _showSubmissionResultDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Submission Result'),
        content: const Text('Your code has been submitted successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Home_Screen()),
              );
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
