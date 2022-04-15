import 'package:kasir_sederhana/cart.dart';
import 'package:flutter/material.dart';

class productPage extends StatelessWidget {
  final List<Cart> carts;
  productPage(this.carts);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: carts.isEmpty ? Column(children: <Widget>[
        Text('tidak ada pesanan', 
        style: Theme.of(context).textTheme.titleMedium ,
          ),
        ],
      ):
    ListView.builder(itemBuilder: (context, index){
      double total_harga = carts[index].harga * carts[index].qty;
      return Card(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(10),
              child: Text(
                carts[index].qty.toString(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Kasir('+carts[index].nama+')',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Text('Pesanan('+carts[index].title+')',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Text('Harga : Rp.' + carts[index].harga.toStringAsFixed(0), 
                style: TextStyle(fontSize: 15, color: Colors.black,
                ),),
                Text('Total : Rp.' + total_harga.toStringAsFixed(0), 
                style: TextStyle(fontSize: 15, color: Colors.black,
                ),),
              ],
            )
          ],
        ),
      );
    },
    itemCount: carts.length,
    )
    );
  }
}