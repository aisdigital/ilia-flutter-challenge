import 'package:flutter/material.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        title: Text(
          'Movie Slasher'.toUpperCase(),
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
