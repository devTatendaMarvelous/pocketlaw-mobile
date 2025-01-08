import 'dart:convert';
/// status : "success"
/// message : "Vehicle fetched"
/// data : {"id":1,"make":"Toyota","model":"Allion","color":"Black","registration_number":"AEJ5142","created_at":"2025-01-02T13:22:32.000000Z","updated_at":"2025-01-02T13:22:32.000000Z","deleted_at":null}

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));
String vehicleToJson(Vehicle data) => json.encode(data.toJson());
class Vehicle {
  Vehicle({
      this.status, 
      this.message, 
      this.data,});

  Vehicle.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
Vehicle copyWith({  String? status,
  String? message,
  Data? data,
}) => Vehicle(  status: status ?? this.status,
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

/// id : 1
/// make : "Toyota"
/// model : "Allion"
/// color : "Black"
/// registration_number : "AEJ5142"
/// created_at : "2025-01-02T13:22:32.000000Z"
/// updated_at : "2025-01-02T13:22:32.000000Z"
/// deleted_at : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.make, 
      this.model, 
      this.color, 
      this.registrationNumber, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    color = json['color'];
    registrationNumber = json['registration_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? make;
  String? model;
  String? color;
  String? registrationNumber;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
Data copyWith({  int? id,
  String? make,
  String? model,
  String? color,
  String? registrationNumber,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Data(  id: id ?? this.id,
  make: make ?? this.make,
  model: model ?? this.model,
  color: color ?? this.color,
  registrationNumber: registrationNumber ?? this.registrationNumber,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['make'] = make;
    map['model'] = model;
    map['color'] = color;
    map['registration_number'] = registrationNumber;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}