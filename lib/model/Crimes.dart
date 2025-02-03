import 'dart:convert';
/// status : "success"
/// message : "Crimes Fetched successfully"
/// data : [{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null,"category":{"id":1,"name":"Category A","min_fine":"10.00","max_fine":"100.00","created_at":"2025-01-02T13:58:45.000000Z","updated_at":"2025-01-02T13:58:45.000000Z","deleted_at":null}},{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null,"category":{"id":1,"name":"Category A","min_fine":"10.00","max_fine":"100.00","created_at":"2025-01-02T13:58:45.000000Z","updated_at":"2025-01-02T13:58:45.000000Z","deleted_at":null}},{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null,"category":{"id":1,"name":"Category A","min_fine":"10.00","max_fine":"100.00","created_at":"2025-01-02T13:58:45.000000Z","updated_at":"2025-01-02T13:58:45.000000Z","deleted_at":null}}]

Crimes crimesFromJson(String str) => Crimes.fromJson(json.decode(str));
String crimesToJson(Crimes data) => json.encode(data.toJson());
class Crimes {
  Crimes({
      this.status, 
      this.message, 
      this.data,});

  Crimes.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<Data>? data;
Crimes copyWith({  String? status,
  String? message,
  List<Data>? data,
}) => Crimes(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// category_id : 1
/// name : "Red Robot"
/// description : "Red Robot"
/// price : "20.00"
/// created_at : "2025-01-02T13:59:09.000000Z"
/// updated_at : "2025-01-02T13:59:09.000000Z"
/// deleted_at : null
/// category : {"id":1,"name":"Category A","min_fine":"10.00","max_fine":"100.00","created_at":"2025-01-02T13:58:45.000000Z","updated_at":"2025-01-02T13:58:45.000000Z","deleted_at":null}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.categoryId, 
      this.name, 
      this.description, 
      this.price, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.category,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Category? category;
Data copyWith({  int? id,
  int? categoryId,
  String? name,
  String? description,
  String? price,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  Category? category,
}) => Data(  id: id ?? this.id,
  categoryId: categoryId ?? this.categoryId,
  name: name ?? this.name,
  description: description ?? this.description,
  price: price ?? this.price,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
  category: category ?? this.category,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Category A"
/// min_fine : "10.00"
/// max_fine : "100.00"
/// created_at : "2025-01-02T13:58:45.000000Z"
/// updated_at : "2025-01-02T13:58:45.000000Z"
/// deleted_at : null

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
      this.id, 
      this.name, 
      this.minFine, 
      this.maxFine, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    minFine = json['min_fine'];
    maxFine = json['max_fine'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? name;
  String? minFine;
  String? maxFine;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
Category copyWith({  int? id,
  String? name,
  String? minFine,
  String? maxFine,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Category(  id: id ?? this.id,
  name: name ?? this.name,
  minFine: minFine ?? this.minFine,
  maxFine: maxFine ?? this.maxFine,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['min_fine'] = minFine;
    map['max_fine'] = maxFine;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}