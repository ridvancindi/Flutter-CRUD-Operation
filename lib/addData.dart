import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/db/dbHelper.dart';
import 'package:flutter_app1/models/product.dart';
import 'package:intl/intl.dart';

class addData extends StatefulWidget {
  addData({Key? key}) : super(key: key);

  @override
  _addDataState createState() => _addDataState();
}

class _addDataState extends State<addData> {
  bool vis = false;
  int? sehir = 1;
  int? num;
  List<Map> ilList = [
    {"id": "15", "name": "BURDUR"},
    {"id": "26", "name": "ESKİŞEHİR"},
    {"id": "18", "name": "ÇANKIRI"},
    {"id": "80", "name": "OSMANİYE"},
    {"id": "41", "name": "KOCAELİ"},
    {"id": "27", "name": "GAZİANTEP"},
    {"id": "31", "name": "HATAY"},
    {"id": "38", "name": "KAYSERİ"},
    {"id": "29", "name": "GÜMÜŞHANE"},
    {"id": "54", "name": "SAKARYA"},
    {"id": "16", "name": "BURSA"},
    {"id": "69", "name": "BAYBURT"},
    {"id": "17", "name": "ÇANAKKALE"},
    {"id": "57", "name": "SİNOP"},
    {"id": "74", "name": "BARTIN"},
    {"id": "503", "name": "MAĞUSA (KIBRIS)"},
    {"id": "33", "name": "MERSİN"},
    {"id": "51", "name": "NİĞDE"},
    {"id": "42", "name": "KONYA"},
    {"id": "60", "name": "TOKAT"},
    {"id": "2", "name": "ADIYAMAN"},
    {"id": "6", "name": "ANKARA"},
    {"id": "66", "name": "YOZGAT"},
    {"id": "52", "name": "ORDU"},
    {"id": "53", "name": "RİZE"},
    {"id": "1", "name": "ADANA"},
    {"id": "40", "name": "KIRŞEHİR"},
    {"id": "76", "name": "IĞDIR"},
    {"id": "45", "name": "MANİSA"},
    {"id": "21", "name": "DİYARBAKIR"},
    {"id": "64", "name": "UŞAK"},
    {"id": "501", "name": "LEFKOŞE (KIBRIS)"},
    {"id": "5", "name": "AMASYA"},
    {"id": "24", "name": "ERZİNCAN"},
    {"id": "32", "name": "ISPARTA"},
    {"id": "502", "name": "GİRNE (KIBRIS)"},
    {"id": "23", "name": "ELAZIĞ"},
    {"id": "78", "name": "KARABÜK"},
    {"id": "30", "name": "HAKKARİ"},
    {"id": "36", "name": "KARS"},
    {"id": "67", "name": "ZONGULDAK"},
    {"id": "68", "name": "AKSARAY"},
    {"id": "44", "name": "MALATYA"},
    {"id": "10", "name": "BALIKESİR"},
    {"id": "20", "name": "DENİZLİ"},
    {"id": "49", "name": "MUŞ"},
    {"id": "73", "name": "ŞIRNAK"},
    {"id": "48", "name": "MUĞLA"},
    {"id": "59", "name": "TEKİRDAĞ"},
    {"id": "39", "name": "KIRKLARELİ"},
    {"id": "56", "name": "SİİRT"},
    {"id": "28", "name": "GİRESUN"},
    {"id": "63", "name": "ŞANLIURFA"},
    {"id": "9", "name": "AYDIN"},
    {"id": "72", "name": "BATMAN"},
    {"id": "13", "name": "BİTLİS"},
    {"id": "3", "name": "AFYONKARAHİSAR"},
    {"id": "8", "name": "ARTVİN"},
    {"id": "4", "name": "AĞRI"},
    {"id": "77", "name": "YALOVA"},
    {"id": "50", "name": "NEVŞEHİR"},
    {"id": "61", "name": "TRABZON"},
    {"id": "58", "name": "SİVAS"},
    {"id": "7", "name": "ANTALYA"},
    {"id": "37", "name": "KASTAMONU"},
    {"id": "47", "name": "MARDİN"},
    {"id": "46", "name": "KAHRAMANMARAŞ"},
    {"id": "25", "name": "ERZURUM"},
    {"id": "75", "name": "ARDAHAN"},
    {"id": "81", "name": "DÜZCE"},
    {"id": "55", "name": "SAMSUN"},
    {"id": "19", "name": "ÇORUM"},
    {"id": "65", "name": "VAN"},
    {"id": "14", "name": "BOLU"},
    {"id": "43", "name": "KÜTAHYA"},
    {"id": "11", "name": "BİLECİK"},
    {"id": "34", "name": "İSTANBUL"},
    {"id": "79", "name": "KİLİS"},
    {"id": "62", "name": "TUNCELİ"},
    {"id": "12", "name": "BİNGÖL"},
    {"id": "22", "name": "EDİRNE"},
    {"id": "71", "name": "KIRIKKALE"},
    {"id": "70", "name": "KARAMAN"},
    {"id": "35", "name": "İZMİR"}
  ];
  var _name = TextEditingController();
  var _surname = TextEditingController();
  List<Map> ilceler = [];
  List<Map> country = [];
  var _phone = TextEditingController();
  var _tc = TextEditingController();
  var _adress = TextEditingController();
  String? _createdDate;
  String? _upgrateDate;
  var _companytitle = TextEditingController();
  var _taxdai = TextEditingController();
  var _taxid = TextEditingController();
  var _companyphone = TextEditingController();
  var _mail = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var _formKey1 = GlobalKey<FormState>();
  bool visables1 = true;
  bool visables2 = false;
  String? _privaceSel;
  String? _districtSel;
  String _countrySel = "TR";
  DbHelper? _databaseHelper;
  List<Product>? allData;
  var _key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    countryGet();
    allData = <Product>[];
    _databaseHelper = DbHelper();
    _databaseHelper!.allData().then((allStudentMapList) {
      for (Map<String, dynamic> okunanStudentMap in allStudentMapList) {
        allData!.add(Product.dbdenOkunanDeger(okunanStudentMap));
      }
      setState(() {});
    }).catchError((hata) => print("Hata $hata"));
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    _createdDate = DateFormat('dd-MM-yyyy').format(now);
    _upgrateDate = DateFormat('dd-MM-yyyy').format(now);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, true);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Veri Ekleme",
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: Icon(Icons.chevron_left_rounded)),
          ),
          body: SingleChildScrollView(
              child: Column(children: [
            Row(children: [
              Expanded(
                child: RadioListTile<int>(
                  activeColor: Colors.purple[300],
                  value: 0,
                  groupValue: sehir,
                  onChanged: (deger) {
                    setState(() {
                      sehir = deger;
                      visables1 = false;
                      visables2 = true;
                      _phone.clear();
                      _companytitle.clear();
                      _companyphone.clear();
                      _mail.clear();
                      _adress.clear();
                      _name.clear();
                      _privaceSel = null;
                      _districtSel = null;
                      _surname.clear();
                      _taxdai.clear();
                      _taxid.clear();
                    });
                  },
                  title: Text('Tüzel'),
                ),
              ),
              Expanded(
                child: RadioListTile<int>(
                  activeColor: Colors.purple[300],
                  value: 1,
                  groupValue: sehir,
                  onChanged: (deger) {
                    setState(() {
                      sehir = deger;
                      visables1 = true;
                      visables2 = false;
                      _phone.clear();
                      _companytitle.clear();
                      _companyphone.clear();
                      _privaceSel = null;
                      _districtSel = null;
                      _mail.clear();
                      _adress.clear();
                      _name.clear();
                      _surname.clear();
                      _taxdai.clear();
                      _taxid.clear();
                    });
                  },
                  title: Text('Şahıs'),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  tuzel(),
                  sahis(),
                  SizedBox(
                    height: 15,
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
                              if (sehir == 0) {
                                if (_formKey.currentState!.validate()) {
                                  addData(Product(
                                      sehir,
                                      _companytitle.text,
                                      null,
                                      _taxid.text,
                                      _taxdai.text,
                                      _phone.text,
                                      _companyphone.text,
                                      _mail.text,
                                      _countrySel,
                                      _privaceSel,
                                      _districtSel,
                                      _adress.text,
                                      null,
                                      null,
                                      _createdDate,
                                      _upgrateDate));
                                  _phone.clear();
                                  _companytitle.clear();
                                  _companyphone.clear();
                                  _mail.clear();
                                  _adress.clear();
                                  _privaceSel = null;
                                  _districtSel = null;
                                  _taxdai.clear();
                                  _taxid.clear();
                                  CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.success,
                                      title: "Başarılı",
                                      text: "Veri Başarıyla Eklendi",
                                      onConfirmBtnTap: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop(true);
                                      });
                                }
                              } else {
                                if (_formKey1.currentState!.validate()) {
                                  addData(Product(
                                      sehir,
                                      null,
                                      null,
                                      _tc.text,
                                      null,
                                      _phone.text,
                                      null,
                                      _mail.text,
                                      _countrySel,
                                      _privaceSel,
                                      _districtSel,
                                      _adress.text,
                                      _name.text,
                                      _surname.text,
                                      _createdDate,
                                      _upgrateDate));
                                  _phone.clear();
                                  _mail.clear();
                                  _adress.clear();
                                  _name.clear();
                                  _surname.clear();
                                  _tc.clear();
                                  _privaceSel = null;
                                  _districtSel = null;
                                  CoolAlert.show(
                                      context: context,
                                      type: CoolAlertType.success,
                                      title: "Başarılı",
                                      text: "Veri Başarıyla Eklendi",
                                      onConfirmBtnTap: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop(true);
                                      });
                                }
                              }
                            });
                          }),
                    ),
                  )
                ],
              ),
            ),
          ]))),
    );
  }

  sahis() {
    return Visibility(
      visible: visables1,
      child: Container(
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
        width: 380,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey1,
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: TextFormField(
                                  controller: _name,
                                  cursorHeight: 1,
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(fontSize: 15),
                                  autofocus: false,
                                  validator: (kontroledilecekname) {
                                    if (kontroledilecekname!.isEmpty) {
                                      return "Burası Boş Olamaz";
                                    } else if (kontroledilecekname.length < 3) {
                                      return "3 Karakterden Küçük Olamaz...";
                                    } else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      labelText: "Adı",
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: TextFormField(
                                  controller: _surname,
                                  keyboardType: TextInputType.name,
                                  style: TextStyle(fontSize: 15),
                                  autofocus: false,
                                  validator: (kontroledilecekname) {
                                    if (kontroledilecekname!.isEmpty) {
                                      return "Burası Boş Olamaz";
                                    } else if (kontroledilecekname.length < 2) {
                                      return "3 Karakterden Küçük Olamaz...";
                                    } else
                                      return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      labelText: "Soyadı",
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          controller: _phone,
                          autofocus: false,
                          validator: (kontroledilecekname) {
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              hintText: "Enter Phone Number",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 15),
                          controller: _mail,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else if (value.contains('@') == false) {
                              return '@ İçermeli';
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              labelText: "e-Posta Adresi",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 15),
                          autofocus: false,
                          controller: _tc,
                          validator: (kontroledilecekname) {
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              labelText: "Tc No",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Adres",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.purple[300],
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          style: TextStyle(fontSize: 15),
                          controller: _adress,
                          autofocus: false,
                          maxLines: 4,
                          validator: (kontroledilecekname) {
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Adres",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        country_city()
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  tuzel() {
    return Visibility(
      visible: visables2,
      child: Container(
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
        width: 380,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          controller: _companytitle,
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 15),
                          autofocus: false,
                          validator: (kontroledilecekname) {
                            if (kontroledilecekname!.length < 4) {
                              return "4 Karekterden Küçük Olamaz";
                            } else
                              return null;
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              labelText: "Firma İsmi",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: TextFormField(
                                  controller: _taxdai,
                                  cursorHeight: 1,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 15),
                                  autofocus: false,
                                  validator: (kontroledilecekname) {
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      labelText: "Vergi Dairesi",
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: TextFormField(
                                  controller: _taxid,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 15),
                                  autofocus: false,
                                  validator: (kontroledilecekname) {
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      labelText: "Vergi Numarası",
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: TextFormField(
                                  controller: _companyphone,
                                  cursorHeight: 1,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 15),
                                  autofocus: false,
                                  validator: (kontroledilecekname) {
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      labelText: "İş Telefonu",
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: TextFormField(
                                  controller: _phone,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(fontSize: 15),
                                  autofocus: false,
                                  validator: (kontroledilecekname) {
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      labelText: "Cep Telefonu",
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _mail,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 15),
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            } else if (value.contains('@') == false) {
                              return '@ İçermeli';
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              labelText: "e-Posta Adresi",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Adres",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.purple[300],
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _adress,
                          keyboardType: TextInputType.streetAddress,
                          style: TextStyle(fontSize: 15),
                          autofocus: false,
                          maxLines: 4,
                          validator: (kontroledilecekname) {
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Adres",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        country_city()
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void addData(Product product) async {
    var addNewData = await _databaseHelper!.addData(product);
  }

  countryGet() async {
    var gelenilceJson = await DefaultAssetBundle.of(context)
        .loadString("assets/json/country.json");
    Map<String, dynamic> jsonilList = json.decode(gelenilceJson.toString());
    for (int i = 0; i < jsonilList["data"].length; i++) {
      country.add({
        "country": jsonilList["data"][i]["country"],
        "abbreviation": jsonilList["data"][i]["abbreviation"]
      });
    }
  }

  ilceGetir(String il) async {
    ilceler.clear();
    var gelenilceJson = await DefaultAssetBundle.of(context)
        .loadString("assets/json/ilce.json");
    Map<String, dynamic> jsonilceList = json.decode(gelenilceJson.toString());
    for (int i = 0; i < jsonilceList["data"].length; i++) {
      if (jsonilceList["data"][i]["il_id"] == il) {
        ilceler.add({
          "id": jsonilceList["data"][i]["id"],
          "name": jsonilceList["data"][i]["name"]
        });
      }
    }
  }

  country_city() {
    return Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<dynamic>(
                                    isDense: true,
                                    value: _countrySel,
                                    hint: Text("Ülke Seçin"),
                                    onChanged: (value) {
                                      setState(() {
                                        _countrySel = value;
                                      });
                                    },
                                    items: country.map((Map map) {
                                      return DropdownMenuItem<String>(
                                        value: map["abbreviation"],
                                        child: Text(
                                          map["country"],
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            Visibility(
                              visible: _countrySel == "TR",
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<dynamic>(
                                            isDense: true,
                                            value: _privaceSel,
                                            hint: Text("İl Seçin"),
                                            onChanged: (value) {
                                              setState(() {
                                                _districtSel = null;
                                                _privaceSel = value;
                                                ilceGetir(_privaceSel!);
                                                vis = true;
                                              });
                                            },
                                            items: ilList.map((Map map) {
                                              return DropdownMenuItem<String>(
                                                value: map["id"].toString(),
                                                child: Text(
                                                  map["name"],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        )),
                                  ),
                                  Visibility(
                                    visible: vis,
                                    child: Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<dynamic>(
                                              isDense: false,
                                              value: _districtSel,
                                              hint: Text("İlçe Seçin"),
                                              onChanged: (value) {
                                                setState(() {
                                                  _districtSel = value;
                                                });
                                              },
                                              items: ilceler.map((Map map) {
                                                return DropdownMenuItem<String>(
                                                  value: map["id"].toString(),
                                                  child: Text(
                                                    ilceler.length == 0
                                                        ? map["name"]
                                                        : map["name"],
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
  }
}
