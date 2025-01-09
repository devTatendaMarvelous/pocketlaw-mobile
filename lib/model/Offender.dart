import 'dart:convert';
/// status : "success"
/// message : "Offender created"
/// data : {"name":"Luke","id_number":"123456","license_number":"AAA2323","email":"starwars@gmail.com","phone":"1255","updated_at":"2025-01-09T10:06:12.000000Z","created_at":"2025-01-09T10:06:12.000000Z","id":18}

Offender offenderFromJson(String str) => Offender.fromJson(json.decode(str));
String offenderToJson(Offender data) => json.encode(data.toJson());
class Offender {
  Offender({
      this.status, 
      this.message, 
      this.data,});

  Offender.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
Offender copyWith({  String? status,
  String? message,
  Data? data,
}) => Offender(  status: status ?? this.status,
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

/// name : "Luke"
/// id_number : "123456"
/// license_number : "AAA2323"
/// email : "starwars@gmail.com"
/// phone : "1255"
/// updated_at : "2025-01-09T10:06:12.000000Z"
/// created_at : "2025-01-09T10:06:12.000000Z"
/// id : 18

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.name, 
      this.idNumber, 
      this.licenseNumber, 
      this.email, 
      this.phone, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    idNumber = json['id_number'];
    licenseNumber = json['license_number'];
    email = json['email'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? idNumber;
  String? licenseNumber;
  String? email;
  String? phone;
  String? updatedAt;
  String? createdAt;
  int? id;
Data copyWith({  String? name,
  String? idNumber,
  String? licenseNumber,
  String? email,
  String? phone,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  name: name ?? this.name,
  idNumber: idNumber ?? this.idNumber,
  licenseNumber: licenseNumber ?? this.licenseNumber,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  updatedAt: updatedAt ?? this.updatedAt,
  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id_number'] = idNumber;
    map['license_number'] = licenseNumber;
    map['email'] = email;
    map['phone'] = phone;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}