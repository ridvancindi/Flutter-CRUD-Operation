class Product {
  int? _id;
  int? _companyType;
  String? _companyTitle;
  String? _companyName;
  String? _taxNo;
  String? _taxAdministration;
  String? _phone;
  String? _companyPhone;
  String? _email;
  String? _countryId;
  String? _provinceId;
  String? _districtId;
  String? _address;
  String? _name;
  String? _lastName;
  String? _createdDate;
  String? _upgrateDate;
    Product(
      this._companyType,
      this._companyTitle,
      this._companyName,
      this._taxNo,
      this._taxAdministration,
      this._phone,
      this._companyPhone,
      this._email,
      this._countryId,
      this._provinceId,
      this._districtId,
      this._address,
      this._name,
      this._lastName,
      this._createdDate,
      this._upgrateDate);
  Product.withId(
      this._id,
      this._companyType,
      this._companyTitle,
      this._companyName,
      this._taxNo,
      this._taxAdministration,
      this._phone,
      this._companyPhone,
      this._email,
      this._countryId,
      this._provinceId,
      this._districtId,
      this._address,
      this._name,
      this._lastName,
      this._createdDate,
      this._upgrateDate);
  int get id => _id!;
  int get companyType => _companyType!;
  String get companyTitle => _companyTitle!;
  String get companyName => _companyName!;
  String get taxNo => _taxNo!;
  String get taxAdministration => _taxAdministration!;
  String get phone => _phone!;
  String get companyPhone => _companyPhone!;
  String get email => _email!;
  String get countryId => _countryId!;
  String get provinceId => _provinceId!;
  String get districtId => _districtId!;
  String get address => _address!;
  String get name => _name!;
  String get lastName => _lastName!;
  String get createdDate => _createdDate!;
  String get upgrateDate => _upgrateDate!;
  set companyType(int value) {
    _companyType = value;
  }

  set companyTitle(String value) {
    _companyTitle = value;
  }

  set companyName(String value) {
    _companyName = value;
  }

  set taxNo(String value) {
    _taxNo = value;
  }

  set taxAdministration(String value) {
    _taxAdministration = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set companyPhone(String value) {
    _companyPhone = value;
  }

  set email(String value) {
    _email = value;
  }

  set countryId(String value) {
    _countryId = value;
  }

  set provinceId(String value) {
    _provinceId = value;
  }
  set districtId(String value) {
    _districtId = value;
  }
  set address(String value) {
    _address = value;
  }

  set name(String value) {
    _name = value;
  }

  set lastName(String value) {
    lastName = value;
  }

  set createdDate(String value) {
    createdDate = value;
  }

  set upgrateDate(String value) {
    upgrateDate = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["id"] = _id;
    map["companyType"] = _companyType;
    map["companyTitle"] =   _companyTitle;
    map["companyName"] =   _companyName;
    map["taxNo"] =   _taxNo;
    map["taxAdministration"] =   _taxAdministration;
    map["phone"] =   _phone;
    map["companyPhone"] =   _companyPhone;
    map["email"] =   _email;
    map["countryId"] =   _countryId;
    map["provinceId"] =   _provinceId;
    map["districtId"] =   _districtId;
    map["address"] =   _address;
    map["name"] =   _name;
    map["lastName"] =   _lastName;
    map["createdDate"] =   _createdDate;
    map["upgrateDate"] =   _upgrateDate;
    
    return map;
  }
    Product.dbdenOkunanDeger(Map<String, dynamic> map){
      this._id = map["id"];
      this._companyType = map["companyType"];
      this._companyTitle = map["companyTitle"];
      this._companyName = map["companyName"];
      this._taxNo = map["taxNo"];
      this._taxAdministration = map["taxAdministration"];
      this._phone = map["phone"];
      this._companyPhone = map["companyPhone"];
      this._email = map["email"];
      this._countryId = map["countryId"];
      this._provinceId = map["provinceId"];
      this._districtId = map["districtId"];
      this._address = map["address"] ;
      this._name = map["name"];
      this._lastName = map["lastName"];
      this._createdDate = map["createdDate"];
      this._upgrateDate = map["upgrateDate"];
  }
}
