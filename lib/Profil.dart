
import 'dart:ui';

import 'package:flutter/material.dart';
import 'detailInfo.dart';
class DrawerWidget extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : ListView(
        padding : EdgeInsets.zero,
        children : <Widget>[
          _drawerHeader(),
          Card(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Info'),
              contentPadding: EdgeInsets.all(8),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => detailInfo(),
                ),
                );
              } ,
            ),
          ),
        ]
      ),
    );
  }
}

Widget _drawerHeader(){
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage('images/iconKasir.png'),
          fit: BoxFit.cover),
    ),

    accountName: Text('ADMIN 1'),
    accountEmail: Text('Kasir Baru'),
  );
}
