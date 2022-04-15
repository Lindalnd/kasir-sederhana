import 'package:flutter/material.dart';
import 'package:kasir_sederhana/main.dart';

class addItem extends StatefulWidget {
  addItem(this.addNew);
  final Function addNew;

  @override
  State<addItem> createState() => _addItemState();
}

class _addItemState extends State<addItem> {
  final titleController =  TextEditingController();
  final namaController =  TextEditingController();
  final hargaController =  TextEditingController();
  final qtyController =  TextEditingController();

  void saveNewItem(){
    final title = titleController.text;
    final nama = namaController.text;
    final harga = hargaController.text;
    final qty = int.parse(qtyController.text);

    if (title.isEmpty || nama.isEmpty || harga.isEmpty || qty<=0){
      return;
    }
    widget.addNew(title,nama,double.parse(harga),qty);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: MyColors.navy,
        title: Text('New Order', style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Pesanan'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Kasir'),
                controller: namaController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Harga'),
                controller: hargaController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Qty'),
                controller: qtyController,
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                child: Text('Add'),
                onPressed: saveNewItem,
                textColor: Colors.black, padding: EdgeInsets.all(8))
            ],
          ),
        ) 
      ),
    );
  }
}