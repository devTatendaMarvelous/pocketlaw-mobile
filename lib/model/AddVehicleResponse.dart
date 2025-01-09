import 'dart:convert';
/// status : "success"
/// message : "Vehicle created"
/// data : {"make":"Toyata","model":"Corrolla","color":"Grey","registration_number":"AAA5656","updated_at":"2025-01-09T13:34:36.000000Z","created_at":"2025-01-09T13:34:36.000000Z","id":73}

AddVehicleResponse addVehicleResponseFromJson(String str) => AddVehicleResponse.fromJson(json.decode(str));
String addVehicleResponseToJson(AddVehicleResponse data) => json.encode(data.toJson());
class AddVehicleResponse {
  AddVehicleResponse({
      this.status, 
      this.message, 
      this.data,});

  AddVehicleResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
AddVehicleResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => AddVehicleResponse(  status: status ?? this.status,
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

/// make : "Toyata"
/// model : "Corrolla"
/// color : "Grey"
/// registration_number : "AAA5656"
/// updated_at : "2025-01-09T13:34:36.000000Z"
/// created_at : "2025-01-09T13:34:36.000000Z"
/// id : 73

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.make, 
      this.model, 
      this.color, 
      this.registrationNumber, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    make = json['make'];
    model = json['model'];
    color = json['color'];
    registrationNumber = json['registration_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? make;
  String? model;
  String? color;
  String? registrationNumber;
  String? updatedAt;
  String? createdAt;
  int? id;
Data copyWith({  String? make,
  String? model,
  String? color,
  String? registrationNumber,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  make: make ?? this.make,
  model: model ?? this.model,
  color: color ?? this.color,
  registrationNumber: registrationNumber ?? this.registrationNumber,
  updatedAt: updatedAt ?? this.updatedAt,
  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['make'] = make;
    map['model'] = model;
    map['color'] = color;
    map['registration_number'] = registrationNumber;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}