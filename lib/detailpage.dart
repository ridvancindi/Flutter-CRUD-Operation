import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/addTransaction.dart';
import 'package:flutter_app1/db/dbHelper.dart';
import 'package:flutter_app1/models/product.dart';
import 'package:flutter_app1/upgrateData.dart';
import 'package:flutter_app1/upgrateTransaction.dart';

import 'models/icdata.dart';

class DetailPage extends StatefulWidget {
  Product product;
  DetailPage(this.product);
  @override
  _DetailPageState createState() => _DetailPageState(product);
}

class _DetailPageState extends State<DetailPage> {
  var _key = GlobalKey<ScaffoldState>();
  DbHelper? _dbHelper = DbHelper();
  Product? product;
  dynamic back = false;
  _DetailPageState(this.product);
  List<Data>? transaction;
  DbHelper? _databaseHelper;
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DbHelper();
  }

  @override
  Widget build(BuildContext context) {
    if (transaction == null) {
      transaction = <Data>[];
      getData();
    }
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, true);
        return Future.value(false);
      },
      child: Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text("Data Detay Sayfası ${product!.name}"),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: Icon(Icons.chevron_left_rounded)),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              setState(() {});
              bool result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addTransaction(product!.id)),
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
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(children: [
              Container(
                alignment: Alignment.center,
                height: 175,
                color: Colors.purple,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Icon(
                      Icons.apartment,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      product!.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {});
                        bool result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => upgrateData(product!)),
                        );
                        if (result) {}
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Düzenle",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 370,
                constraints: BoxConstraints.loose(Size.fromHeight(60.0)),
                child: Stack(
                    alignment: Alignment.topCenter,
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: -10.0,
                        child: Container(
                          width: 370,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Veri Bilgileri",
                                            style: TextStyle(fontSize: 17),
                                          )),
                                      Container(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              delete();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                    Icons
                                                        .delete_forever_outlined,
                                                    size: 22,
                                                    color: Colors.red),
                                                Text("Veriyi Sil",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.red))
                                              ],
                                            ),
                                          ))
                                    ]),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Firma / Kullanıcı İsmi",
                                            style: TextStyle(fontSize: 16),
                                          )),
                                      Container(
                                          alignment: Alignment.bottomRight,
                                          child: Row(
                                            children: [
                                              Text(product!.name,
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              product!.companyType != 0
                                                  ? Text(product!.lastName,
                                                      style: TextStyle(
                                                          fontSize: 15))
                                                  : Container()
                                            ],
                                          ))
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 10,
                                  color: Colors.black38,
                                  thickness: 1.5,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                product!.companyType == 0
                                    ? Column(
                                        children: [
                                          new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Text(
                                                      "İş Telefonu",
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )),
                                                Container(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Text(
                                                        product!.companyPhone,
                                                        style: TextStyle(
                                                            fontSize: 15)))
                                              ]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            height: 10,
                                            color: Colors.black38,
                                            thickness: 1.5,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )
                                    : new Container(),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Cep Telefonu",
                                            style: TextStyle(fontSize: 16),
                                          )),
                                      Container(
                                          alignment: Alignment.bottomRight,
                                          child: Text(product!.phone,
                                              style: TextStyle(fontSize: 15)))
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 10,
                                  color: Colors.black38,
                                  thickness: 1.5,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Mail",
                                            style: TextStyle(fontSize: 16),
                                          )),
                                      Container(
                                          alignment: Alignment.bottomRight,
                                          child: Text(product!.email,
                                              style: TextStyle(fontSize: 15)))
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 175,
              ),
              Text("Transaction"),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 380,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transaction!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.only(top: 15),
                        child: ListTile(
                          title: Text(transaction![index].contents),
                          subtitle: transaction![index].date != null
                              ? Text(transaction![index].date)
                              : Container(),
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.apartment,
                              color: Colors.black45.withOpacity(0.2),
                              size: 30,
                            ),
                          ),
                          trailing: Wrap(children: [
                            GestureDetector(
                              onTap: () async {
                                bool result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => upgrateTansaction(
                                            transaction![index])));
                                if (result) {
                                  getData();
                                }
                              },
                              child: Icon(Icons.edit),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                deleteTransaction(transaction![index].id);
                              },
                              child: Icon(Icons.delete),
                            ),
                          ]),
                        ),
                      );
                    }),
              ),
            ]),
          )),
    );
  }

  void getData() async {
    var dbFuture = _databaseHelper!.initializeDatabase();
    await dbFuture.then((value) {
      var proFuture = _databaseHelper!.allTransaction();
      proFuture.then((value) async {
        List<Data> transactionData = [];
        count = value.length;
        for (var i = 0; i < count; i++) {
          if (product!.id == value[i]["companyId"]) {
            transactionData.add(Data.dbdenOkunanDeger(value[i]));
          }
        }
        setState(() {
          transaction = transactionData;
          count = count;
        });
      });
    });
  }

  void upgrate(Product product) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => upgrateData(product)));
  }

  void delete() async {
    int result;
    back = true;
    Navigator.pop(context, back);
    result = await _dbHelper!.dataDelete(product!.id);
  }

  void deleteTransaction(int id) async {
    int result;
    result = await _dbHelper!.dataTransactionDelete(id);
    getData();
  }
}
/*
Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(children: [
          ListView.builder(
                    itemCount: transaction!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        //margin: EdgeInsets.only(top: 15),
                        child: ListTile(
                          title: Text("products![index].name"),
                          subtitle: Text("products![index].email"),
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: Icon(
                              Icons.apartment,
                              color: Colors.black45.withOpacity(0.2),
                              size: 30,
                            ),
                          ),
                        ),
                      );
                    }),
        ]),
              ),
            ),
 */