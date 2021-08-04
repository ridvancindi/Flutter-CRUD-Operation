import 'package:flutter/material.dart';
import 'package:flutter_app1/db/dbHelper.dart';
import 'package:flutter_app1/models/product.dart';
import 'package:flutter_app1/upgrateData.dart';

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
  @override
  Widget build(BuildContext context) {
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
          body: Column(children: [
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
                      if (result) {
                        
                      }
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
                            style: TextStyle(color: Colors.white, fontSize: 16))
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
                                                  Icons.delete_forever_outlined,
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
                                                style: TextStyle(fontSize: 15)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            product!.companyType != 0
                                                ? Text(product!.lastName,
                                                    style:
                                                        TextStyle(fontSize: 15))
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    "İş Telefonu",
                                                    style:
                                                        TextStyle(fontSize: 16),
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
                    )
                  ]),
            )
          ])),
    );
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
}
