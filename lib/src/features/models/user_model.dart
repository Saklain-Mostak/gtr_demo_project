class UserModel {
  String? userName;
  String? token;
  int? userId;
  int? comId;
  String? email;
  String? companyName;
  String? roleName;
  String? weightScaleBarcodeStartWith;
  String? empImagePath;
  List<CompanyUserList>? companyUserList;
  List<ServerList>? serverList;
  bool? isSerialSales;
  int? decimalField;
  String? businessTypeName;
  int? defaultCurrencyId;
  String? currencySymbol;
  String? currencyShortName;
  bool? isVatLogin;
  List<String>? printerIPAddress;

  UserModel({
    this.userName,
    this.token,
    this.userId,
    this.comId,
    this.email,
    this.companyName,
    this.roleName,
    this.weightScaleBarcodeStartWith,
    this.empImagePath,
    this.companyUserList,
    this.serverList,
    this.isSerialSales,
    this.decimalField,
    this.businessTypeName,
    this.defaultCurrencyId,
    this.currencySymbol,
    this.currencyShortName,
    this.isVatLogin,
    this.printerIPAddress,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    token = json['Token'];
    userId = json['UserId'];
    comId = json['ComId'];
    email = json['Email'];
    companyName = json['CompanyName'];
    roleName = json['RoleName'];
    weightScaleBarcodeStartWith = json['WeightScaleBarcodeStartWith'];
    empImagePath = json['EmpImagePath'];

    if (json['CompanyUserList'] != null) {
      companyUserList = <CompanyUserList>[];
      json['CompanyUserList'].forEach((v) {
        companyUserList!.add(CompanyUserList.fromJson(v));
      });
    }

    if (json['ServerList'] != null) {
      serverList = <ServerList>[];
      json['ServerList'].forEach((v) {
        serverList!.add(ServerList.fromJson(v));
      });
    }

    isSerialSales = json['IsSerialSales'];
    decimalField = json['DecimalField'];
    businessTypeName = json['BusinessTypeName'];
    defaultCurrencyId = json['DefaultCurrencyId'];
    currencySymbol = json['CurrencySymbol'];
    currencyShortName = json['CurrencyShortName'];
    isVatLogin = json['IsVatLogin'];

    if (json['PrinterIPAddress'] != null) {
      printerIPAddress = List<String>.from(json['PrinterIPAddress']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = userName;
    data['Token'] = token;
    data['UserId'] = userId;
    data['ComId'] = comId;
    data['Email'] = email;
    data['CompanyName'] = companyName;
    data['RoleName'] = roleName;
    data['WeightScaleBarcodeStartWith'] = weightScaleBarcodeStartWith;
    data['EmpImagePath'] = empImagePath;

    if (companyUserList != null) {
      data['CompanyUserList'] =
          companyUserList!.map((v) => v.toJson()).toList();
    }

    if (serverList != null) {
      data['ServerList'] = serverList!.map((v) => v.toJson()).toList();
    }

    data['IsSerialSales'] = isSerialSales;
    data['DecimalField'] = decimalField;
    data['BusinessTypeName'] = businessTypeName;
    data['DefaultCurrencyId'] = defaultCurrencyId;
    data['CurrencySymbol'] = currencySymbol;
    data['CurrencyShortName'] = currencyShortName;
    data['IsVatLogin'] = isVatLogin;
    if (printerIPAddress != null) {
      data['PrinterIPAddress'] = printerIPAddress;
    }
    return data;
  }
}

class CompanyUserList {
  String? text;
  String? value;
  int? defaultCurrencyId;

  CompanyUserList({this.text, this.value, this.defaultCurrencyId});

  CompanyUserList.fromJson(Map<String, dynamic> json) {
    text = json['Text'];
    value = json['Value'];
    defaultCurrencyId = json['DefaultCurrencyId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Text'] = text;
    data['Value'] = value;
    data['DefaultCurrencyId'] = defaultCurrencyId;
    return data;
  }
}

class ServerList {
  String? serverName;
  String? serverAddress;
  bool? isActive;
  int? id;

  ServerList({this.serverName, this.serverAddress, this.isActive, this.id});

  ServerList.fromJson(Map<String, dynamic> json) {
    serverName = json['ServerName'];
    serverAddress = json['ServerAddress'];
    isActive = json['IsActive'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ServerName'] = serverName;
    data['ServerAddress'] = serverAddress;
    data['IsActive'] = isActive;
    data['Id'] = id;
    return data;
  }
}
