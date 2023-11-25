import 'package:flutter/material.dart';

class HellowScreen extends StatefulWidget {
  const HellowScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HellowScreenState createState() => _HellowScreenState();
}

class _HellowScreenState extends State<HellowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Hello!!!!'),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}
