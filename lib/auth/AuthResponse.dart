import 'dart:convert';
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3BvY2tldGxhdy5lYXN5Z3JhYi5jby56dy9hcGkvbG9naW4iLCJpYXQiOjE3MzU5MTA1NzAsImV4cCI6MTczNTkxNDE3MCwibmJmIjoxNzM1OTEwNTcwLCJqdGkiOiI1a2d5aHF6MEcyOXI2RmFiIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.X7eZBj6TWDxKmwYZQBFzYreEAQB4sJ3w8oSmSv31koU"
/// token_type : "bearer"
/// expires_in : 3600
/// payment_methods : [{"id":1,"name":"Ecocash USD","created_at":"2025-01-03T12:06:15.000000Z","updated_at":"2025-01-03T12:06:15.000000Z","deleted_at":null},{"id":2,"name":"Swipe USD","created_at":"2025-01-03T12:06:26.000000Z","updated_at":"2025-01-03T12:06:26.000000Z","deleted_at":null}]
/// currencies : [{"id":1,"name":"United States Dollar","code":"USD","rate":1,"is_base":1,"active":1,"created_at":"2025-01-03T11:47:36.000000Z","updated_at":"2025-01-03T11:47:36.000000Z","deleted_at":null},{"id":2,"name":"Zimbabwe Gold","code":"ZWG","rate":30,"is_base":0,"active":1,"created_at":"2025-01-03T11:48:02.000000Z","updated_at":"2025-01-03T11:48:02.000000Z","deleted_at":null}]
/// crimes : [{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null,"category":{"id":1,"name":"Category A","min_fine":"10.00","max_fine":"100.00","created_at":"2025-01-02T13:58:45.000000Z","updated_at":"2025-01-02T13:58:45.000000Z","deleted_at":null}}]

AuthResponse authResponseFromJson(String str) => AuthResponse.fromJson(json.decode(str));
String authResponseToJson(AuthResponse data) => json.encode(data.toJson());
class AuthResponse {
  AuthResponse({
      this.accessToken, 
      this.tokenType, 
      this.expiresIn, 
      this.paymentMethods, 
      this.currencies, 
      this.crimes,});

  AuthResponse.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    if (json['payment_methods'] != null) {
      paymentMethods = [];
      json['payment_methods'].forEach((v) {
        paymentMethods?.add(PaymentMethods.fromJson(v));
      });
    }
    if (json['currencies'] != null) {
      currencies = [];
      json['currencies'].forEach((v) {
        currencies?.add(Currencies.fromJson(v));
      });
    }
    if (json['crimes'] != null) {
      crimes = [];
      json['crimes'].forEach((v) {
        crimes?.add(Crimes.fromJson(v));
      });
    }
  }
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  List<PaymentMethods>? paymentMethods;
  List<Currencies>? currencies;
  List<Crimes>? crimes;
AuthResponse copyWith({  String? accessToken,
  String? tokenType,
  int? expiresIn,
  List<PaymentMethods>? paymentMethods,
  List<Currencies>? currencies,
  List<Crimes>? crimes,
}) => AuthResponse(  accessToken: accessToken ?? this.accessToken,
  tokenType: tokenType ?? this.tokenType,
  expiresIn: expiresIn ?? this.expiresIn,
  paymentMethods: paymentMethods ?? this.paymentMethods,
  currencies: currencies ?? this.currencies,
  crimes: crimes ?? this.crimes,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    if (paymentMethods != null) {
      map['payment_methods'] = paymentMethods?.map((v) => v.toJson()).toList();
    }
    if (currencies != null) {
      map['currencies'] = currencies?.map((v) => v.toJson()).toList();
    }
    if (crimes != null) {
      map['crimes'] = crimes?.map((v) => v.toJson()).toList();
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

Crimes crimesFromJson(String str) => Crimes.fromJson(json.decode(str));
String crimesToJson(Crimes data) => json.encode(data.toJson());
class Crimes {
  Crimes({
      this.id, 
      this.categoryId, 
      this.name, 
      this.description, 
      this.price, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.category,});

  Crimes.fromJson(dynamic json) {
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
Crimes copyWith({  int? id,
  int? categoryId,
  String? name,
  String? description,
  String? price,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  Category? category,
}) => Crimes(  id: id ?? this.id,
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

/// id : 1
/// name : "United States Dollar"
/// code : "USD"
/// rate : 1
/// is_base : 1
/// active : 1
/// created_at : "2025-01-03T11:47:36.000000Z"
/// updated_at : "2025-01-03T11:47:36.000000Z"
/// deleted_at : null

Currencies currenciesFromJson(String str) => Currencies.fromJson(json.decode(str));
String currenciesToJson(Currencies data) => json.encode(data.toJson());
class Currencies {
  Currencies({
      this.id, 
      this.name, 
      this.code, 
      this.rate, 
      this.isBase, 
      this.active, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Currencies.fromJson(dynamic json) {
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
Currencies copyWith({  int? id,
  String? name,
  String? code,
  int? rate,
  int? isBase,
  int? active,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Currencies(  id: id ?? this.id,
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

/// id : 1
/// name : "Ecocash USD"
/// created_at : "2025-01-03T12:06:15.000000Z"
/// updated_at : "2025-01-03T12:06:15.000000Z"
/// deleted_at : null

PaymentMethods paymentMethodsFromJson(String str) => PaymentMethods.fromJson(json.decode(str));
String paymentMethodsToJson(PaymentMethods data) => json.encode(data.toJson());
class PaymentMethods {
  PaymentMethods({
      this.id, 
      this.name, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  PaymentMethods.fromJson(dynamic json) {
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
PaymentMethods copyWith({  int? id,
  String? name,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => PaymentMethods(  id: id ?? this.id,
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