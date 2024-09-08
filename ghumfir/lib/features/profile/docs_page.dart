import 'package:flutter/material.dart';

class DocumentPage extends StatelessWidget {
  final String title;
  final String excerpt;
  const DocumentPage({super.key, required this.title, required this.excerpt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Text(excerpt),
      ),
    );
  }
}
