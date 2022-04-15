import 'package:flutter/material.dart';

class detailInfo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
        centerTitle: true,
      ),
      body: BottomAppBar(child: Text('aplikasi ini masih dalam versi 1.0', 
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      )
    );
  }
}