import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final int number;
  const GridCard({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: 'hero$number',
          child: Card(
            color: Colors.blueAccent,
            child: Text('Hello $number World'),
          ),
        ),
      ),
    );
  }
}
