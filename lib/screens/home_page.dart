import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invest Guide'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Guide'),
            SizedBox(height: 20,),
            RaisedButton(child: Text('OK'),),
          ],
        ),
      ),
    );
  }
}