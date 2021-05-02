import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Colors.red,
            );
          },
        ),
      ),
    );
  }
}
