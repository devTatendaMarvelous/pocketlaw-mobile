import 'dart:convert';
/// status : "success"
/// message : "Payment created"
/// data : {"reference":"PMT-96812","crime_id":2,"payment_method_id":1,"amount":20,"currency_id":1,"updated_at":"2025-01-07T06:59:27.000000Z","created_at":"2025-01-07T06:59:27.000000Z","id":7,"crime":{"id":2,"offender_id":1,"vehicle_id":1,"location":"AEJ5142","reference":"CRM-84203","crime_id":1,"occurrence_time":"2025-01-02 00:00:00","status":"PENDING","created_at":"2025-01-02T13:59:17.000000Z","updated_at":"2025-01-02T13:59:17.000000Z","deleted_at":null},"currency":{"id":1,"name":"United States Dollar","code":"USD","rate":1,"is_base":1,"active":1,"created_at":"2025-01-03T11:47:36.000000Z","updated_at":"2025-01-03T11:47:36.000000Z","deleted_at":null},"payment_method":{"id":1,"name":"Ecocash USD","created_at":"2025-01-03T12:06:15.000000Z","updated_at":"2025-01-03T12:06:15.000000Z","deleted_at":null}}

PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));
String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());
class PaymentResponse {
  PaymentResponse({
      this.status, 
      this.message, 
      this.data,});

  PaymentResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
PaymentResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => PaymentResponse(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// reference : "PMT-96812"
/// crime_id : 2
/// payment_method_id : 1
/// amount : 20
/// currency_id : 1
/// updated_at : "2025-01-07T06:59:27.000000Z"
/// created_at : "2025-01-07T06:59:27.000000Z"
/// id : 7
/// crime : {"id":2,"offender_id":1,"vehicle_id":1,"location":"AEJ5142","reference":"CRM-84203","crime_id":1,"occurrence_time":"2025-01-02 00:00:00","status":"PENDING","created_at":"2025-01-02T13:59:17.000000Z","updated_at":"2025-01-02T13:59:17.000000Z","deleted_at":null}
/// currency : {"id":1,"name":"United States Dollar","code":"USD","rate":1,"is_base":1,"active":1,"created_at":"2025-01-03T11:47:36.000000Z","updated_at":"2025-01-03T11:47:36.000000Z","deleted_at":null}
/// payment_method : {"id":1,"name":"Ecocash USD","created_at":"2025-01-03T12:06:15.000000Z","updated_at":"2025-01-03T12:06:15.000000Z","deleted_at":null}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.reference, 
      this.crimeId, 
      this.paymentMethodId, 
      this.amount, 
      this.currencyId, 
      this.updatedAt, 
      this.createdAt, 
      this.id, 
      this.crime, 
      this.currency, 
      this.paymentMethod,});

  Data.fromJson(dynamic json) {
    reference = json['reference'];
    crimeId = json['crime_id'];
    paymentMethodId = json['payment_method_id'];
    amount = (json['amount'] as num).toDouble();;
    currencyId = json['currency_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    crime = json['crime'] != null ? Crime.fromJson(json['crime']) : null;
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    paymentMethod = json['payment_method'] != null ? PaymentMethod.fromJson(json['payment_method']) : null;
  }
  String? reference;
  int? crimeId;
  int? paymentMethodId;
  double? amount;
  int? currencyId;
  String? updatedAt;
  String? createdAt;
  int? id;
  Crime? crime;
  Currency? currency;
  PaymentMethod? paymentMethod;
Data copyWith({  String? reference,
  int? crimeId,
  int? paymentMethodId,
  double? amount,
  int? currencyId,
  String? updatedAt,
  String? createdAt,
  int? id,
  Crime? crime,
  Currency? currency,
  PaymentMethod? paymentMethod,
}) => Data(  reference: reference ?? this.reference,
  crimeId: crimeId ?? this.crimeId,
  paymentMethodId: paymentMethodId ?? this.paymentMethodId,
  amount: amount ?? this.amount,
  currencyId: currencyId ?? this.currencyId,
  updatedAt: updatedAt ?? this.updatedAt,
  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
  crime: crime ?? this.crime,
  currency: currency ?? this.currency,
  paymentMethod: paymentMethod ?? this.paymentMethod,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reference'] = reference;
    map['crime_id'] = crimeId;
    map['payment_method_id'] = paymentMethodId;
    map['amount'] = amount;
    map['currency_id'] = currencyId;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    if (crime != null) {
      map['crime'] = crime?.toJson();
    }
    if (currency != null) {
      map['currency'] = currency?.toJson();
    }
    if (paymentMethod != null) {
      map['payment_method'] = paymentMethod?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Ecocash USD"
/// created_at : "2025-01-03T12:06:15.000000Z"
/// updated_at : "2025-01-03T12:06:15.000000Z"
/// deleted_at : null

PaymentMethod paymentMethodFromJson(String str) => PaymentMethod.fromJson(json.decode(str));
String paymentMethodToJson(PaymentMethod data) => json.encode(data.toJson());
class PaymentMethod {
  PaymentMethod({
      this.id, 
      this.name, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  PaymentMethod.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
PaymentMethod copyWith({  int? id,
  String? name,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => PaymentMethod(  id: id ?? this.id,
  name: name ?? this.name,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}

/// id : 1
/// name : "United States Dollar"
/// code : "USD"
/// rate : 1
/// is_base : 1
/// active : 1
/// created_at : "2025-01-03T11:47:36.000000Z"
/// updated_at : "2025-01-03T11:47:36.000000Z"
/// deleted_at : null

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));
String currencyToJson(Currency data) => json.encode(data.toJson());
class Currency {
  Currency({
      this.id, 
      this.name, 
      this.code, 
      this.rate, 
      this.isBase, 
      this.active, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Currency.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    rate = json['rate'];
    isBase = json['is_base'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? name;
  String? code;
  int? rate;
  int? isBase;
  int? active;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
Currency copyWith({  int? id,
  String? name,
  String? code,
  int? rate,
  int? isBase,
  int? active,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Currency(  id: id ?? this.id,
  name: name ?? this.name,
  code: code ?? this.code,
  rate: rate ?? this.rate,
  isBase: isBase ?? this.isBase,
  active: active ?? this.active,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['code'] = code;
    map['rate'] = rate;
    map['is_base'] = isBase;
    map['active'] = active;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}

/// id : 2
/// offender_id : 1
/// vehicle_id : 1
/// location : "AEJ5142"
/// reference : "CRM-84203"
/// crime_id : 1
/// occurrence_time : "2025-01-02 00:00:00"
/// status : "PENDING"
/// created_at : "2025-01-02T13:59:17.000000Z"
/// updated_at : "2025-01-02T13:59:17.000000Z"
/// deleted_at : null

Crime crimeFromJson(String str) => Crime.fromJson(json.decode(str));
String crimeToJson(Crime data) => json.encode(data.toJson());
class Crime {
  Crime({
      this.id, 
      this.offenderId, 
      this.vehicleId, 
      this.location, 
      this.reference, 
      this.crimeId, 
      this.occurrenceTime, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Crime.fromJson(dynamic json) {
    id = json['id'];
    offenderId = json['offender_id'];
    vehicleId = json['vehicle_id'];
    location = json['location'];
    reference = json['reference'];
    crimeId = json['crime_id'];
    occurrenceTime = json['occurrence_time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  int? offenderId;
  int? vehicleId;
  String? location;
  String? reference;
  int? crimeId;
  String? occurrenceTime;
  String? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
Crime copyWith({  int? id,
  int? offenderId,
  int? vehicleId,
  String? location,
  String? reference,
  int? crimeId,
  String? occurrenceTime,
  String? status,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Crime(  id: id ?? this.id,
  offenderId: offenderId ?? this.offenderId,
  vehicleId: vehicleId ?? this.vehicleId,
  location: location ?? this.location,
  reference: reference ?? this.reference,
  crimeId: crimeId ?? this.crimeId,
  occurrenceTime: occurrenceTime ?? this.occurrenceTime,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['offender_id'] = offenderId;
    map['vehicle_id'] = vehicleId;
    map['location'] = location;
    map['reference'] = reference;
    map['crime_id'] = crimeId;
    map['occurrence_time'] = occurrenceTime;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}