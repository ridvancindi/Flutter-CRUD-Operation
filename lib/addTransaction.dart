import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'db/dbHelper.dart';
import 'models/icdata.dart';

class addTransaction extends StatefulWidget {
  int id;
  addTransaction(this.id);

  @override
  _addTransactionState createState() => _addTransactionState(id);
}

class _addTransactionState extends State<addTransaction> {
  int id;
  _addTransactionState(this.id);
  var _content = TextEditingController();
  var _date = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  DbHelper? _databaseHelper;
  List<Data>? allData;
  var _key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    allData = <Data>[];
    _databaseHelper = DbHelper();
    _databaseHelper!.allData().then((allStudentMapList) {
      for (Map<String, dynamic> okunanStudentMap in allStudentMapList) {
        allData!.add(Data.dbdenOkunanDeger(okunanStudentMap));
      }
      setState(() {});
    }).catchError((hata) => print("Hata $hata"));
  }

  String? _selectDate;
  String? _selectHour;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, true);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add Transaction"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 15),
                    autofocus: false,
                    controller: _content,
                    validator: (kontroledilecekname) {
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        labelText: "Content",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    showCursor: true,
                    readOnly: true,
                    onTap: (){
                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1960),
                                        lastDate: DateTime(2025))
                                    .then((value) {
                                  setState(() {
                                    _selectDate = DateFormat('yyyy-MM-dd')
                                        .format(value!)
                                        .toString();
                                  });
                                });
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    autofocus: false,
                    controller: _date,
                    validator: (kontroledilecekname) {
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: GestureDetector(
                          onTap: (){
                            showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1960),
                                        lastDate: DateTime(2025))
                                    .then((value) {
                                  setState(() {
                                    _selectDate = DateFormat('yyyy-MM-dd')
                                        .format(value!)
                                        .toString();
                                  });
                                });
                          },
                          child: Icon(Icons.date_range),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hintText: _selectDate != null ? _selectDate : "Tarih",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    showCursor: true,
                    readOnly: true,
                    onTap: (){
                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                    .then((value) {
                                      setState(() {
                                        _selectHour = value!.format(context);
                                      });
                                  
                                });
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    autofocus: false,
                    controller: _date,
                    validator: (kontroledilecekname) {
                      return null;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.watch_later),
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        hintText: _selectHour != null ? _selectHour : "Saat",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                          child: Text(
                            "Kaydet",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                addData(Data(id, _content.text, _selectDate,
                                    _selectHour, null));
                                Navigator.of(context).pop(true);
                              }
                            });
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void addData(Data data) async {
    var addNewData = await _databaseHelper!.addTransaction(data);
  }
}
