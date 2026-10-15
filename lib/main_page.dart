import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 40, 72),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 40, 72),
        title: const Text(
          'Ֆիլմեր',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: TextField(
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 167, 128, 206),
              ),
              hintText: 'Որոնել ֆիլմ...',
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ),
    );
  }
}
