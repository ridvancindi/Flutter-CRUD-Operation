import 'dart:async';
import 'dart:io';

import 'package:flutter_app1/models/product.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  String tblProduct = "product";
  String colid = "id";
  String colcompanyType = "companyType";
  String colcompanyTitle = "companyTitle";
  String colcompanyName = "companyName";
  String coltaxNo = "taxNo";
  String coltaxAdministration = "taxAdministration";
  String colphone = "phone";
  String colcompanyPhone = "companyPhone";
  String colemail = "email";
  String colcountryId = "countryId";
  String colprovinceId = "provinceId";
  String coldistrictId = "districtId";
  String coladdress = "address";
  String colname = "name";
  String collastName = "lastName";
  String colcreatedDate = "createdDate";
  String colupgrateDate = "upgrateDate";
  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal();
  factory DbHelper() {
    return _dbHelper;
  }
  static Database? _db;
  Future<Database> _getDatabase() async {
    if (_db == null) {
      _db = await initializeDatabase();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future<Database> initializeDatabase() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    String dbpath = join(klasor.path, "data.db");
    var productDb = openDatabase(dbpath, version: 1, onCreate: _createDb);
    return productDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tblProduct ($colid INTEGER PRIMARY KEY AUTOINCREMENT, $colcompanyType int,$colcompanyTitle text NULL, $colcompanyName text NULL, $coltaxNo text NULL, $coltaxAdministration text NULL, $colphone text NULL, $colcompanyPhone text NULL, $colemail text NULL, $colcountryId int NULL, $colprovinceId text NULL, $coldistrictId text NULL, $coladdress text NULL, $colname text NULL, $collastName text NULL , $colcreatedDate text NULL, $colupgrateDate text NULL)");
  }

  Future<int> addData(Product product) async {
    var db = await _getDatabase();
    var sonuc = await db.insert(tblProduct, product.toMap(),
        nullColumnHack: "$colid");
    print("eklendi " + sonuc.toString());
    return sonuc;
  }

  Future<List<Map<String, dynamic>>> allData() async {
    var db = await _getDatabase();
    var sonuc = await db.rawQuery("SELECT coalesce(name,companyTitle) name,coalesce(companyTitle,name) companyTitle , id , phone , email ,companyType, companyPhone ,lastname,taxNo,address,email,provinceId,districtId,companyTitle,taxAdministration,upgrateDate,createdDate,countryId from product");
    return sonuc;
  }
  //Kullanıcı Güncelleme
  Future<int> dataUpgrate(Product product) async{
    var db = await _getDatabase();
    var sonuc = await db.update(tblProduct, product.toMap(),where: "$colid = ?",whereArgs: [product.id]);
    return sonuc;
  }
  Future<int> dataDelete(int id) async{
    var db = await _getDatabase();
    var sonuc =await db.delete(tblProduct,where: "$colid =?",whereArgs: [id]);
    return sonuc;
  }
}
/*


  DatabaseHelper._internal();
  Future<Database> _getDatabase() async {
    if (_database == null) {
      print("Db Burası Çalıştır null");
      _database = await _initializeDatabase();
      return _database!;
    } else {
      print("Db Burası Çalıştır null");
      return _database!;
    }
  }

  _initializeDatabase() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    String dbpath = join(klasor.path, "student.db");
    print("Data base : $dbpath");
    var studentdb = openDatabase(dbpath, version: 1, onCreate: _createDb);
    return studentdb;
  }

  Future<void> _createDb(Database db, int version) async {
    print("Create db methodu çalıştı");
    await db.execute(
        "");
  }

  //Kullanıcı Ekleme
  Future<int> studentAdd(Student student) async {
    var db = await _getDatabase();
    var sonuc = await db.insert(_studentTable, student.toMap(),
        nullColumnHack: "$_columnId");
    print("eklendi " + sonuc.toString());
    return sonuc;
  }
  //Listeleme
  Future<List<Map<String, dynamic>>> allstudent() async {
    var db = await _getDatabase();
    var sonuc = await db.query(_studentTable, orderBy: "$_columnId DESC");
    return sonuc;
  }
  //Kullanıcı Güncelleme
  Future<int> studentUpgrate(Student student) async{
    var db = await _getDatabase();
    var sonuc = await db.update(_studentTable, student.toMap(),where: "$_columnId = ?",whereArgs: [student.id]);
    return sonuc;
  }
  // 1 Kullanıcı Silme
  Future<int> studentDelete(int id) async{
    var db = await _getDatabase();
    var sonuc =await db.delete(_studentTable,where: "$_columnId =?",whereArgs: [id]);
    print("${id.toString()} İdli Kullanıcı Silindi");
    return sonuc;
  }
  // Tüm Kullanıcıları Silme
  Future<int> studentAllDelete() async{
    var db = await _getDatabase();
    var sonuc =await db.delete(_studentTable);
    print("Tüm Hepsi Silindi");
    return sonuc;

  }
*/
/*
  // void getData(){
  //   var dbFuture = _databaseHelper!.initializeDatabase();
  //   dbFuture.then((value){
  //     var proFuture = _databaseHelper!.listData();
  //     proFuture.then((value){
  //       List<Product>  productsData = [];
  //       count = value.length;
  //       for (var i = 0; i < count; i++) {
  //         productsData.add(Product.dbdenOkunanDeger(value[i]));
  //       }
  //       setState(() {
  //         products = productsData;
  //         count = count;
  //       });
  //     });
  //   });
  // } */