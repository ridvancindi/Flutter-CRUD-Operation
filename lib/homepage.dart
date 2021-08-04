import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_app1/addData.dart';
import 'package:flutter_app1/detailpage.dart';

import 'db/dbHelper.dart';
import 'models/product.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product>? allData;
  List<Product>? products;
  DbHelper? _databaseHelper;
  int count = 0;
  @override
  void initState() {
    super.initState();
    _databaseHelper = DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    if (products == null) {
      products = <Product>[];
      getData();
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "AnaSayfa",
        style: TextStyle(color: Colors.white),
      )),
      body: Container(
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: products!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.only(top: 15),
                    child: ListTile(
                      title: Text(products![index].name),
                      subtitle: Text(products![index].email),
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.apartment,
                          color: Colors.black45.withOpacity(0.2),
                          size: 30,
                        ),
                      ),
                      onTap: () {
                        goDetail(products![index], index);
                      },
                      // trailing: Wrap(children: [
                      //   GestureDetector(
                      //     onTap: () {

                      //     },
                      //     child: Icon(Icons.edit),
                      //   ),
                      //   SizedBox(
                      //     width: 10,
                      //   ),
                      //   GestureDetector(
                      //     onTap: () {

                      //     },
                      //     child: Icon(Icons.delete),
                      //   ),
                      // ]),
                    ),
                  );
                }),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
          bool result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addData()),
          );
          if (result) {
            getData();
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void getData() {
    var dbFuture = _databaseHelper!.initializeDatabase();
    dbFuture.then((value) {
      var proFuture = _databaseHelper!.allData();
      proFuture.then((value) {
        List<Product> productsData = [];
        count = value.length;
        for (var i = 0; i < count; i++) {
          productsData.add(Product.dbdenOkunanDeger(value[i]));
        }
        setState(() {
          products = productsData;
          count = count;
        });
      });
    });
  }

  void goDetail(Product product, int index) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(product)));
    if (result) {
      getData();
    }
  }
  
}

/*
 child: Column(
          children: [
            Container(
              height: 175,
              color: Colors.purple[300],
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
 */