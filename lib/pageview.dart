import 'package:flutter/material.dart';

class QuranApp extends StatelessWidget {
  final List<String> pages = [
    "Page 1 content",
    "Page 2 content",
    "Page 3 content",
    // add more pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Container(
            child: Center(
              child: Text(pages[index]),
            ),
          );
        },
      ),
    );
  }
}