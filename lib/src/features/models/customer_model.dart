

class CustomerModel {
  int? success;
  bool? error;
  List<CustomerList>? customerList;
  PageInfo? pageInfo;

  CustomerModel({
    this.success,
    this.error,
    this.customerList,
    this.pageInfo,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    success = (json['Success'] as num?)?.toInt();
    error = json['error'];
    if (json['CustomerList'] != null) {
      customerList = <CustomerList>[];
      json['CustomerList'].forEach((v) {
        customerList!.add(CustomerList.fromJson(v));
      });
    }
    pageInfo = json['PageInfo'] != null
        ? PageInfo.fromJson(json['PageInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Success'] = success;
    data['error'] = error;
    if (customerList != null) {
      data['CustomerList'] = customerList!.map((v) => v.toJson()).toList();
    }
    if (pageInfo != null) {
      data['PageInfo'] = pageInfo!.toJson();
    }
    return data;
  }
}

class CustomerList {
  int? id;
  String? name;
  String? email;
  String? primaryAddress;
  String? secoundaryAddress;
  String? notes;
  String? phone;
  String? custType;
  String? parentCustomer;
  String? imagePath;
  double? totalDue;
  String? lastSalesDate;
  String? lastInvoiceNo;
  String? lastSoldProduct;
  int? totalSalesValue;
  int? totalSalesReturnValue;
  int? totalAmountBack;
  int? totalCollection;
  String? lastTransactionDate;
  String? clinetCompanyName;

  CustomerList({
    this.id,
    this.name,
    this.email,
    this.primaryAddress,
    this.secoundaryAddress,
    this.notes,
    this.phone,
    this.custType,
    this.parentCustomer,
    this.imagePath,
    this.totalDue,
    this.lastSalesDate,
    this.lastInvoiceNo,
    this.lastSoldProduct,
    this.totalSalesValue,
    this.totalSalesReturnValue,
    this.totalAmountBack,
    this.totalCollection,
    this.lastTransactionDate,
    this.clinetCompanyName,
  });

  CustomerList.fromJson(Map<String, dynamic> json) {
    id = (json['Id'] as num?)?.toInt();
    name = json['Name']??"Saklain Mostak";
    email = json['Email']??"saklain.pub@gmail.com";
    primaryAddress = json['PrimaryAddress']??"Notun Bazar,Dhaka";
    secoundaryAddress = json['SecoundaryAddress']??"Badda, Dhaka";
    notes = json['Notes'];
    phone = json['Phone']??"01518989122";
    custType = json['CustType'];
    parentCustomer = json['ParentCustomer']?.toString();
    imagePath = json['ImagePath']?.toString();
    totalDue = (json['TotalDue'] as num?)?.toDouble();
    lastSalesDate = json['LastSalesDate'];
    lastInvoiceNo = json['LastInvoiceNo'];
    lastSoldProduct = json['LastSoldProduct'];
    totalSalesValue = (json['TotalSalesValue'] as num?)?.toInt();
    totalSalesReturnValue = (json['TotalSalesReturnValue'] as num?)?.toInt();
    totalAmountBack = (json['TotalAmountBack'] as num?)?.toInt();
    totalCollection = (json['TotalCollection'] as num?)?.toInt();
    lastTransactionDate = json['LastTransactionDate'];
    clinetCompanyName = json['ClinetCompanyName']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Email'] = email;
    data['PrimaryAddress'] = primaryAddress;
    data['SecoundaryAddress'] = secoundaryAddress;
    data['Notes'] = notes;
    data['Phone'] = phone;
    data['CustType'] = custType;
    data['ParentCustomer'] = parentCustomer;
    data['ImagePath'] = imagePath;
    data['TotalDue'] = totalDue;
    data['LastSalesDate'] = lastSalesDate;
    data['LastInvoiceNo'] = lastInvoiceNo;
    data['LastSoldProduct'] = lastSoldProduct;
    data['TotalSalesValue'] = totalSalesValue;
    data['TotalSalesReturnValue'] = totalSalesReturnValue;
    data['TotalAmountBack'] = totalAmountBack;
    data['TotalCollection'] = totalCollection;
    data['LastTransactionDate'] = lastTransactionDate;
    data['ClinetCompanyName'] = clinetCompanyName;
    return data;
  }
}

class PageInfo {
  int? pageNo;
  int? pageSize;
  int? pageCount;
  int? totalRecordCount;

  PageInfo({
    this.pageNo,
    this.pageSize,
    this.pageCount,
    this.totalRecordCount,
  });

  PageInfo.fromJson(Map<String, dynamic> json) {
    pageNo = (json['PageNo'] as num?)?.toInt();
    pageSize = (json['PageSize'] as num?)?.toInt();
    pageCount = (json['PageCount'] as num?)?.toInt();
    totalRecordCount = (json['TotalRecordCount'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PageNo'] = pageNo;
    data['PageSize'] = pageSize;
    data['PageCount'] = pageCount;
    data['TotalRecordCount'] = totalRecordCount;
    return data;
  }
}
