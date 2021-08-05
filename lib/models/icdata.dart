class Data {
  int? _id;
  int? _companyId;
  String? _contents;
  String? _date;
  String? _hour;
  bool? _price ;
    Data(
      this._companyId,
      this._contents,
      this._date,
      this._hour,
      this._price);
  Data.withId(
      this._id,
      this._companyId,
      this._contents,
      this._date,
      this._hour,
      this._price);
  int get id => _id!;
  int get companyId => _companyId!;
  String get contents => _contents!;
  String get date => _date!;
  String get hour => _hour!;
  bool get price => _price!;
  set companyId(int value) {
    _companyId = value;
  }

  set contents(String value) {
    _contents = value;
  }
  set date(String value) {
    _date = value;
  }
  set hour(String value) {
    _hour = value;
  }
   set price(bool value) {
    _price = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["id"] = _id;
    map["companyId"] = _companyId;
    map["contents"] =   _contents;
    map["date"] =   _date;
    map["hour"] =   _hour;
    map["price"] =   _price;
    
    return map;
  }
    Data.dbdenOkunanDeger(Map<String, dynamic> map){
      this._id = map["id"];
      this._companyId = map["companyId"];
      this._contents = map["contents"];
      this._date = map["date"];
      this._hour = map["hour"];
      this._price = map["price"];
  }
  
}
