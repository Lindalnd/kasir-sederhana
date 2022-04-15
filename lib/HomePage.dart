import 'package:flutter/material.dart';
import 'cart.dart';
import 'addItem.dart';
import 'cart.dart';

class HomePage extends StatelessWidget {
  final List<Cart> _listCart;
  HomePage(this._listCart);

  int get totalItem {
    return _listCart.fold(0, (sum, item) {
      return sum += item.qty;
    });
  }

  double get totalPrice {
    return _listCart.fold(0, (sum, item){
      double total_harga = item.qty * item.harga;
      return sum += total_harga;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(children: <Widget>[
              Text('Total pesanan : ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
              Text(totalItem.toString() + ' qty', style: TextStyle(fontSize: 15),),
            ],
            ),
            Row(children: <Widget>[
              Text('Total semua pesanan : ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 4,),
              Text('Rp.' + totalPrice.toStringAsFixed(0), style: TextStyle(fontSize: 15),),
            ],
            ),
          ],
        ), 
        ),
    );
  }
}