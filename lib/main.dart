
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasir_sederhana/Profil.dart';
import 'package:kasir_sederhana/detailInfo.dart';
import 'package:kasir_sederhana/productPage.dart';
import 'addItem.dart';
import 'HomePage.dart';
import 'cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kasir Sederhana',
      theme: ThemeData(
             primarySwatch: MyColors.navy,
      ),

      home: _home(),
    );
  }
}

class MyColors {

  static const MaterialColor navy = MaterialColor(
    0xFF162A49,
    <int, Color>{
      50: Color(0xFF162A49),
      100: Color(0xFF162A49),
      200: Color(0xFF162A49),
      300: Color(0xFF162A49),
      400: Color(0xFF162A49),
      500: Color(0xFF162A49),
      600: Color(0xFF162A49),
      700: Color(0xFF162A49),
      800: Color(0xFF162A49),
      900: Color(0xFF162A49),
    },
  );
}


class _home extends StatefulWidget {

  @override
  State<_home> createState() => __homeState();
}

class __homeState extends State<_home> {
  final List<Cart> _carts = [];
  void _openModal(BuildContext context){
    showCupertinoModalPopup(context: context, builder: (_){
      return addItem(_addNewItem);
    });
  }

  void _addNewItem(String title, String nama, double harga, int qty){
    final newItem = Cart(id : DateTime.now().toString(), title : title, nama : nama, harga: harga, qty : qty);
    setState(() {
      _carts.add(newItem);
    });
  }

  void reset(){
    setState(() {
      _carts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white
        ),
        onPressed: () => _openModal(context)
      ),

      appBar: AppBar(
        title: Text('Aplikasi Kasir Sederhana'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.delete, color: Colors.white,),
            onPressed: () => reset(),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          HomePage(_carts),
          productPage(_carts),
        ],
      )),

    );
  }
}


