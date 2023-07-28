class GrowthModel {
  int? pageNumber;
  int? pageSize;
  int? recordsFiltered;
  int? recordsTotal;
  bool? hasNextPage;
  bool? hasPreviousPage;
  bool? isFirstPage;
  bool? isLastPage;
  int? pageCount;
  int? lastItemOnPage;
  int? firstItemOnPage;
  bool? succeeded;
  Null? message;
  Null? errors;
  List<Data>? data;

  GrowthModel(
      {this.pageNumber,
      this.pageSize,
      this.recordsFiltered,
      this.recordsTotal,
      this.hasNextPage,
      this.hasPreviousPage,
      this.isFirstPage,
      this.isLastPage,
      this.pageCount,
      this.lastItemOnPage,
      this.firstItemOnPage,
      this.succeeded,
      this.message,
      this.errors,
      this.data});

  GrowthModel.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    recordsFiltered = json['recordsFiltered'];
    recordsTotal = json['recordsTotal'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
    isFirstPage = json['isFirstPage'];
    isLastPage = json['isLastPage'];
    pageCount = json['pageCount'];
    lastItemOnPage = json['lastItemOnPage'];
    firstItemOnPage = json['firstItemOnPage'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['recordsFiltered'] = this.recordsFiltered;
    data['recordsTotal'] = this.recordsTotal;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['isFirstPage'] = this.isFirstPage;
    data['isLastPage'] = this.isLastPage;
    data['pageCount'] = this.pageCount;
    data['lastItemOnPage'] = this.lastItemOnPage;
    data['firstItemOnPage'] = this.firstItemOnPage;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? petId;
  int? value;
  int? growthType;
  String? date;
  String? nameOfMonth;

  Data(
      {this.id,
      this.petId,
      this.value,
      this.growthType,
      this.date,
      this.nameOfMonth});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    petId = json['petId'];
    value = json['value'];
    growthType = json['growthType'];
    date = json['date'];
    nameOfMonth = json['nameOfMonth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['petId'] = this.petId;
    data['value'] = this.value;
    data['growthType'] = this.growthType;
    data['date'] = this.date;
    data['nameOfMonth'] = this.nameOfMonth;
    return data;
  }
}
