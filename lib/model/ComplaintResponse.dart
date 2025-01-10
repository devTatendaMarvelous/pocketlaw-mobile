import 'dart:convert';
/// status : "success"
/// message : "Complaint created"
/// data : {"title":"ZiComplaint","body":"haaaa ndatorerwa mari neporisi","attachment":"ZiComplaint_1736509098.txt","file_type":"txt","updated_at":"2025-01-10T11:38:18.000000Z","created_at":"2025-01-10T11:38:18.000000Z","id":4}

ComplaintResponse complaintResponseFromJson(String str) => ComplaintResponse.fromJson(json.decode(str));
String complaintResponseToJson(ComplaintResponse data) => json.encode(data.toJson());
class ComplaintResponse {
  ComplaintResponse({
      this.status, 
      this.message, 
      this.data,});

  ComplaintResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
ComplaintResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => ComplaintResponse(  status: status ?? this.status,
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

/// title : "ZiComplaint"
/// body : "haaaa ndatorerwa mari neporisi"
/// attachment : "ZiComplaint_1736509098.txt"
/// file_type : "txt"
/// updated_at : "2025-01-10T11:38:18.000000Z"
/// created_at : "2025-01-10T11:38:18.000000Z"
/// id : 4

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.title, 
      this.body, 
      this.attachment, 
      this.fileType, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    title = json['title'];
    body = json['body'];
    attachment = json['attachment'];
    fileType = json['file_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? title;
  String? body;
  String? attachment;
  String? fileType;
  String? updatedAt;
  String? createdAt;
  int? id;
Data copyWith({  String? title,
  String? body,
  String? attachment,
  String? fileType,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  title: title ?? this.title,
  body: body ?? this.body,
  attachment: attachment ?? this.attachment,
  fileType: fileType ?? this.fileType,
  updatedAt: updatedAt ?? this.updatedAt,
  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['body'] = body;
    map['attachment'] = attachment;
    map['file_type'] = fileType;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}