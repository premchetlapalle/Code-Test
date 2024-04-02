import 'package:code_test/code_editor.dart';
import 'package:flutter/material.dart';

Widget buildProblemContainer({
  required String imagePath,
  required String title,
  required String description,
  required List<Color> gradientColors,
  required BuildContext context,
  required Color arrowColor,
}) {
  return Container(
    height: 150.0,
    margin: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        tileMode: TileMode.clamp,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: CircleAvatar(
            radius: 37.0,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                description,
                style: const TextStyle(fontSize: 19.0, color: Colors.white70),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      "Are you sure you want to start the test?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Code_Editor()),
                          );
                        },
                      ),
                      TextButton(
                        child: const Text("No", style: TextStyle(fontSize: 17)),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: arrowColor,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
