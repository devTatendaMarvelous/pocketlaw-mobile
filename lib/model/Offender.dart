import 'dart:convert';
/// status : "success"
/// message : "Offender Fetched"
/// data : {"id":1,"name":"Tapson Jim","id_number":"1234567890-w","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null,"crimes":[{"id":2,"offender_id":1,"vehicle_id":1,"location":"AEJ5142","reference":"CRM-84203","crime_id":1,"occurrence_time":"2025-01-02 00:00:00","status":"PENDING","created_at":"2025-01-02T13:59:17.000000Z","updated_at":"2025-01-02T13:59:17.000000Z","deleted_at":null}]}

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

/// id : 1
/// name : "Tapson Jim"
/// id_number : "1234567890-w"
/// license_number : "AEJ5142"
/// created_at : "2025-01-02T13:25:04.000000Z"
/// updated_at : "2025-01-02T13:25:04.000000Z"
/// deleted_at : null
/// crimes : [{"id":2,"offender_id":1,"vehicle_id":1,"location":"AEJ5142","reference":"CRM-84203","crime_id":1,"occurrence_time":"2025-01-02 00:00:00","status":"PENDING","created_at":"2025-01-02T13:59:17.000000Z","updated_at":"2025-01-02T13:59:17.000000Z","deleted_at":null}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.name, 
      this.idNumber, 
      this.licenseNumber, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.crimes,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    idNumber = json['id_number'];
    licenseNumber = json['license_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['crimes'] != null) {
      crimes = [];
      json['crimes'].forEach((v) {
        crimes?.add(Crimes.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? idNumber;
  String? licenseNumber;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Crimes>? crimes;
Data copyWith({  int? id,
  String? name,
  String? idNumber,
  String? licenseNumber,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  List<Crimes>? crimes,
}) => Data(  id: id ?? this.id,
  name: name ?? this.name,
  idNumber: idNumber ?? this.idNumber,
  licenseNumber: licenseNumber ?? this.licenseNumber,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
  crimes: crimes ?? this.crimes,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['id_number'] = idNumber;
    map['license_number'] = licenseNumber;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    if (crimes != null) {
      map['crimes'] = crimes?.map((v) => v.toJson()).toList();
    }
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

Crimes crimesFromJson(String str) => Crimes.fromJson(json.decode(str));
String crimesToJson(Crimes data) => json.encode(data.toJson());
class Crimes {
  Crimes({
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

  Crimes.fromJson(dynamic json) {
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
Crimes copyWith({  int? id,
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
}) => Crimes(  id: id ?? this.id,
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