import 'dart:convert';
/// status : "success"
/// message : "Vehicle fetched"
/// data : {"id":1,"make":"Toyota","model":"Allion","color":"Black","registration_number":"AEJ5142","created_at":"2025-01-02T13:22:32.000000Z","updated_at":"2025-01-02T13:22:32.000000Z","deleted_at":null,"crimes":[{"id":2,"offender_id":1,"vehicle_id":1,"location":"AEJ5142","reference":"CRM-84203","crime_id":1,"occurrence_time":"2025-01-02 00:00:00","status":"PENDING","created_at":"2025-01-02T13:59:17.000000Z","updated_at":"2025-01-02T13:59:17.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":3,"offender_id":1,"vehicle_id":1,"location":"2nd Street","reference":"CRM-82755","crime_id":3,"occurrence_time":"2025-01-06 13:27:27","status":"PENDING","created_at":"2025-01-06T11:27:28.000000Z","updated_at":"2025-01-06T11:27:28.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":4,"offender_id":1,"vehicle_id":1,"location":"2nd Street","reference":"CRM-67296","crime_id":3,"occurrence_time":"2025-01-06 13:39:00","status":"PENDING","created_at":"2025-01-06T11:39:01.000000Z","updated_at":"2025-01-06T11:39:01.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":5,"offender_id":9,"vehicle_id":1,"location":"4th rank","reference":"CRM-31054","crime_id":3,"occurrence_time":"2025-01-07 09:44:13","status":"PENDING","created_at":"2025-01-07T07:44:14.000000Z","updated_at":"2025-01-07T07:44:14.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":9,"name":"Smith","id_number":"456789-K","email":null,"phone":"","license_number":"12345-Q","created_at":"2025-01-07T07:42:45.000000Z","updated_at":"2025-01-07T07:42:45.000000Z","deleted_at":null}},{"id":6,"offender_id":1,"vehicle_id":1,"location":"Harare","reference":"CRM-78028","crime_id":3,"occurrence_time":"2025-01-07 09:57:55","status":"PENDING","created_at":"2025-01-07T07:57:56.000000Z","updated_at":"2025-01-07T07:57:56.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":7,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-62667","crime_id":1,"occurrence_time":"2025-01-07 10:28:31","status":"PENDING","created_at":"2025-01-07T08:28:32.000000Z","updated_at":"2025-01-07T08:28:32.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":8,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-89847","crime_id":1,"occurrence_time":"2025-01-07 10:50:13","status":"PENDING","created_at":"2025-01-07T08:50:15.000000Z","updated_at":"2025-01-07T08:50:15.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":9,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-85489","crime_id":1,"occurrence_time":"2025-01-07 10:56:41","status":"PENDING","created_at":"2025-01-07T08:56:43.000000Z","updated_at":"2025-01-07T08:56:43.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":10,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-4981","crime_id":1,"occurrence_time":"2025-01-07 10:58:24","status":"PENDING","created_at":"2025-01-07T08:58:26.000000Z","updated_at":"2025-01-07T08:58:26.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":11,"offender_id":1,"vehicle_id":1,"location":"SekeRd","reference":"CRM-12578","crime_id":2,"occurrence_time":"2025-01-07 11:04:54","status":"PENDING","created_at":"2025-01-07T09:04:56.000000Z","updated_at":"2025-01-07T09:04:56.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":12,"offender_id":10,"vehicle_id":1,"location":"Mutare Rd","reference":"CRM-6436","crime_id":2,"occurrence_time":"2025-01-07 15:22:24","status":"PENDING","created_at":"2025-01-07T13:22:26.000000Z","updated_at":"2025-01-07T13:22:26.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":13,"offender_id":10,"vehicle_id":1,"location":"Mutare Rd","reference":"CRM-54574","crime_id":2,"occurrence_time":"2025-01-07 15:23:47","status":"PENDING","created_at":"2025-01-07T13:23:49.000000Z","updated_at":"2025-01-07T13:23:49.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":14,"offender_id":10,"vehicle_id":1,"location":"Rd.. no","reference":"CRM-69525","crime_id":2,"occurrence_time":"2025-01-07 15:29:49","status":"PENDING","created_at":"2025-01-07T13:29:51.000000Z","updated_at":"2025-01-07T13:29:51.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":15,"offender_id":10,"vehicle_id":1,"location":"2nd Str","reference":"CRM-59432","crime_id":2,"occurrence_time":"2025-01-07 15:33:02","status":"PENDING","created_at":"2025-01-07T13:33:03.000000Z","updated_at":"2025-01-07T13:33:03.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":16,"offender_id":1,"vehicle_id":1,"location":"3rd street","reference":"CRM-15656","crime_id":2,"occurrence_time":"2025-01-08 09:35:49","status":"PENDING","created_at":"2025-01-08T07:35:51.000000Z","updated_at":"2025-01-08T07:35:51.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":17,"offender_id":1,"vehicle_id":1,"location":"SekeRd","reference":"CRM-26500","crime_id":2,"occurrence_time":"2025-01-08 09:37:28","status":"PENDING","created_at":"2025-01-08T07:37:30.000000Z","updated_at":"2025-01-08T07:37:30.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":18,"offender_id":13,"vehicle_id":1,"location":"Seke Rd","reference":"CRM-63072","crime_id":2,"occurrence_time":"2025-01-08 11:04:36","status":"PENDING","created_at":"2025-01-08T09:04:38.000000Z","updated_at":"2025-01-08T09:04:38.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":13,"name":"James t","id_number":"1234567","email":null,"phone":"","license_number":"AEG12345","created_at":"2025-01-08T09:03:08.000000Z","updated_at":"2025-01-08T09:03:08.000000Z","deleted_at":null}},{"id":19,"offender_id":15,"vehicle_id":1,"location":"Southerton","reference":"CRM-16691","crime_id":3,"occurrence_time":"2025-01-08 16:59:49","status":"PENDING","created_at":"2025-01-08T14:59:50.000000Z","updated_at":"2025-01-08T14:59:50.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":15,"name":"Sydney Muzadzi","id_number":"63-2266745-a44","email":null,"phone":"","license_number":"at234","created_at":"2025-01-08T14:59:04.000000Z","updated_at":"2025-01-08T14:59:04.000000Z","deleted_at":null}},{"id":20,"offender_id":16,"vehicle_id":1,"location":"2nd Street","reference":"CRM-32784","crime_id":3,"occurrence_time":"2025-01-09 11:27:47","status":"PENDING","created_at":"2025-01-09T09:27:49.000000Z","updated_at":"2025-01-09T09:27:49.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":16,"name":"jame bond","id_number":"007","email":null,"phone":"","license_number":"2334456","created_at":"2025-01-09T09:27:02.000000Z","updated_at":"2025-01-09T09:27:02.000000Z","deleted_at":null}},{"id":21,"offender_id":22,"vehicle_id":1,"location":"Tonaz","reference":"CRM-48400","crime_id":2,"occurrence_time":"2025-01-10 15:01:28","status":"PENDING","created_at":"2025-01-10T13:01:29.000000Z","updated_at":"2025-01-10T13:01:29.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":22,"name":"Test","id_number":"132684jgdjd88","email":"test@gmail.com","phone":"+263716291396","license_number":"Hdj67eiw","created_at":"2025-01-10T13:00:55.000000Z","updated_at":"2025-01-10T13:00:55.000000Z","deleted_at":null}},{"id":22,"offender_id":24,"vehicle_id":1,"location":"Seke","reference":"CRM-42812","crime_id":2,"occurrence_time":"2025-01-13 10:48:45","status":"PENDING","created_at":"2025-01-13T08:48:45.000000Z","updated_at":"2025-01-13T08:48:45.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":24,"name":"James","id_number":"234667","email":"email@gmail.com","phone":"698777","license_number":"896778888","created_at":"2025-01-13T08:46:10.000000Z","updated_at":"2025-01-13T08:46:10.000000Z","deleted_at":null}},{"id":23,"offender_id":27,"vehicle_id":1,"location":"Seke Road","reference":"CRM-24461","crime_id":2,"occurrence_time":"2025-01-27 11:59:18","status":"PENDING","created_at":"2025-01-27T09:59:19.000000Z","updated_at":"2025-01-27T09:59:19.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":27,"name":"john","id_number":"123456677","email":"f@gmail.com","phone":"0788790769","license_number":"AAA2121","created_at":"2025-01-27T09:58:41.000000Z","updated_at":"2025-01-27T09:58:41.000000Z","deleted_at":null}},{"id":24,"offender_id":28,"vehicle_id":1,"location":"Seke Road","reference":"CRM-27660","crime_id":2,"occurrence_time":"2025-02-03 12:45:53","status":"PENDING","created_at":"2025-02-03T10:45:55.000000Z","updated_at":"2025-02-03T10:45:55.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":28,"name":"John smith","id_number":"12345678","email":"h@Gmail. com","phone":"0776556554","license_number":"12345678","created_at":"2025-02-03T10:28:21.000000Z","updated_at":"2025-02-03T10:28:21.000000Z","deleted_at":null}},{"id":25,"offender_id":29,"vehicle_id":1,"location":"harare","reference":"CRM-41109","crime_id":2,"occurrence_time":"2025-02-06 14:48:30","status":"PENDING","created_at":"2025-02-06T12:48:31.000000Z","updated_at":"2025-02-06T12:48:31.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":29,"name":"hdjdjjsjs","id_number":"537382","email":null,"phone":"24 6383829","license_number":"gshsj","created_at":"2025-02-06T12:47:49.000000Z","updated_at":"2025-02-06T12:47:49.000000Z","deleted_at":null}}]}

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
/// crimes : [{"id":2,"offender_id":1,"vehicle_id":1,"location":"AEJ5142","reference":"CRM-84203","crime_id":1,"occurrence_time":"2025-01-02 00:00:00","status":"PENDING","created_at":"2025-01-02T13:59:17.000000Z","updated_at":"2025-01-02T13:59:17.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":3,"offender_id":1,"vehicle_id":1,"location":"2nd Street","reference":"CRM-82755","crime_id":3,"occurrence_time":"2025-01-06 13:27:27","status":"PENDING","created_at":"2025-01-06T11:27:28.000000Z","updated_at":"2025-01-06T11:27:28.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":4,"offender_id":1,"vehicle_id":1,"location":"2nd Street","reference":"CRM-67296","crime_id":3,"occurrence_time":"2025-01-06 13:39:00","status":"PENDING","created_at":"2025-01-06T11:39:01.000000Z","updated_at":"2025-01-06T11:39:01.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":5,"offender_id":9,"vehicle_id":1,"location":"4th rank","reference":"CRM-31054","crime_id":3,"occurrence_time":"2025-01-07 09:44:13","status":"PENDING","created_at":"2025-01-07T07:44:14.000000Z","updated_at":"2025-01-07T07:44:14.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":9,"name":"Smith","id_number":"456789-K","email":null,"phone":"","license_number":"12345-Q","created_at":"2025-01-07T07:42:45.000000Z","updated_at":"2025-01-07T07:42:45.000000Z","deleted_at":null}},{"id":6,"offender_id":1,"vehicle_id":1,"location":"Harare","reference":"CRM-78028","crime_id":3,"occurrence_time":"2025-01-07 09:57:55","status":"PENDING","created_at":"2025-01-07T07:57:56.000000Z","updated_at":"2025-01-07T07:57:56.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":7,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-62667","crime_id":1,"occurrence_time":"2025-01-07 10:28:31","status":"PENDING","created_at":"2025-01-07T08:28:32.000000Z","updated_at":"2025-01-07T08:28:32.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":8,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-89847","crime_id":1,"occurrence_time":"2025-01-07 10:50:13","status":"PENDING","created_at":"2025-01-07T08:50:15.000000Z","updated_at":"2025-01-07T08:50:15.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":9,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-85489","crime_id":1,"occurrence_time":"2025-01-07 10:56:41","status":"PENDING","created_at":"2025-01-07T08:56:43.000000Z","updated_at":"2025-01-07T08:56:43.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":10,"offender_id":1,"vehicle_id":1,"location":"5th Avenue","reference":"CRM-4981","crime_id":1,"occurrence_time":"2025-01-07 10:58:24","status":"PENDING","created_at":"2025-01-07T08:58:26.000000Z","updated_at":"2025-01-07T08:58:26.000000Z","deleted_at":null,"crime":{"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":11,"offender_id":1,"vehicle_id":1,"location":"SekeRd","reference":"CRM-12578","crime_id":2,"occurrence_time":"2025-01-07 11:04:54","status":"PENDING","created_at":"2025-01-07T09:04:56.000000Z","updated_at":"2025-01-07T09:04:56.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":12,"offender_id":10,"vehicle_id":1,"location":"Mutare Rd","reference":"CRM-6436","crime_id":2,"occurrence_time":"2025-01-07 15:22:24","status":"PENDING","created_at":"2025-01-07T13:22:26.000000Z","updated_at":"2025-01-07T13:22:26.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":13,"offender_id":10,"vehicle_id":1,"location":"Mutare Rd","reference":"CRM-54574","crime_id":2,"occurrence_time":"2025-01-07 15:23:47","status":"PENDING","created_at":"2025-01-07T13:23:49.000000Z","updated_at":"2025-01-07T13:23:49.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":14,"offender_id":10,"vehicle_id":1,"location":"Rd.. no","reference":"CRM-69525","crime_id":2,"occurrence_time":"2025-01-07 15:29:49","status":"PENDING","created_at":"2025-01-07T13:29:51.000000Z","updated_at":"2025-01-07T13:29:51.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":15,"offender_id":10,"vehicle_id":1,"location":"2nd Str","reference":"CRM-59432","crime_id":2,"occurrence_time":"2025-01-07 15:33:02","status":"PENDING","created_at":"2025-01-07T13:33:03.000000Z","updated_at":"2025-01-07T13:33:03.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":10,"name":"James","id_number":"234677","email":null,"phone":"","license_number":"123456","created_at":"2025-01-07T13:21:38.000000Z","updated_at":"2025-01-07T13:21:38.000000Z","deleted_at":null}},{"id":16,"offender_id":1,"vehicle_id":1,"location":"3rd street","reference":"CRM-15656","crime_id":2,"occurrence_time":"2025-01-08 09:35:49","status":"PENDING","created_at":"2025-01-08T07:35:51.000000Z","updated_at":"2025-01-08T07:35:51.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":17,"offender_id":1,"vehicle_id":1,"location":"SekeRd","reference":"CRM-26500","crime_id":2,"occurrence_time":"2025-01-08 09:37:28","status":"PENDING","created_at":"2025-01-08T07:37:30.000000Z","updated_at":"2025-01-08T07:37:30.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}},{"id":18,"offender_id":13,"vehicle_id":1,"location":"Seke Rd","reference":"CRM-63072","crime_id":2,"occurrence_time":"2025-01-08 11:04:36","status":"PENDING","created_at":"2025-01-08T09:04:38.000000Z","updated_at":"2025-01-08T09:04:38.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":13,"name":"James t","id_number":"1234567","email":null,"phone":"","license_number":"AEG12345","created_at":"2025-01-08T09:03:08.000000Z","updated_at":"2025-01-08T09:03:08.000000Z","deleted_at":null}},{"id":19,"offender_id":15,"vehicle_id":1,"location":"Southerton","reference":"CRM-16691","crime_id":3,"occurrence_time":"2025-01-08 16:59:49","status":"PENDING","created_at":"2025-01-08T14:59:50.000000Z","updated_at":"2025-01-08T14:59:50.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":15,"name":"Sydney Muzadzi","id_number":"63-2266745-a44","email":null,"phone":"","license_number":"at234","created_at":"2025-01-08T14:59:04.000000Z","updated_at":"2025-01-08T14:59:04.000000Z","deleted_at":null}},{"id":20,"offender_id":16,"vehicle_id":1,"location":"2nd Street","reference":"CRM-32784","crime_id":3,"occurrence_time":"2025-01-09 11:27:47","status":"PENDING","created_at":"2025-01-09T09:27:49.000000Z","updated_at":"2025-01-09T09:27:49.000000Z","deleted_at":null,"crime":{"id":3,"category_id":1,"name":"Over Speeding","description":"Over Speeding","price":"60.00","created_at":"2025-01-06T07:09:06.000000Z","updated_at":"2025-01-06T07:09:06.000000Z","deleted_at":null},"offender":{"id":16,"name":"jame bond","id_number":"007","email":null,"phone":"","license_number":"2334456","created_at":"2025-01-09T09:27:02.000000Z","updated_at":"2025-01-09T09:27:02.000000Z","deleted_at":null}},{"id":21,"offender_id":22,"vehicle_id":1,"location":"Tonaz","reference":"CRM-48400","crime_id":2,"occurrence_time":"2025-01-10 15:01:28","status":"PENDING","created_at":"2025-01-10T13:01:29.000000Z","updated_at":"2025-01-10T13:01:29.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":22,"name":"Test","id_number":"132684jgdjd88","email":"test@gmail.com","phone":"+263716291396","license_number":"Hdj67eiw","created_at":"2025-01-10T13:00:55.000000Z","updated_at":"2025-01-10T13:00:55.000000Z","deleted_at":null}},{"id":22,"offender_id":24,"vehicle_id":1,"location":"Seke","reference":"CRM-42812","crime_id":2,"occurrence_time":"2025-01-13 10:48:45","status":"PENDING","created_at":"2025-01-13T08:48:45.000000Z","updated_at":"2025-01-13T08:48:45.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":24,"name":"James","id_number":"234667","email":"email@gmail.com","phone":"698777","license_number":"896778888","created_at":"2025-01-13T08:46:10.000000Z","updated_at":"2025-01-13T08:46:10.000000Z","deleted_at":null}},{"id":23,"offender_id":27,"vehicle_id":1,"location":"Seke Road","reference":"CRM-24461","crime_id":2,"occurrence_time":"2025-01-27 11:59:18","status":"PENDING","created_at":"2025-01-27T09:59:19.000000Z","updated_at":"2025-01-27T09:59:19.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":27,"name":"john","id_number":"123456677","email":"f@gmail.com","phone":"0788790769","license_number":"AAA2121","created_at":"2025-01-27T09:58:41.000000Z","updated_at":"2025-01-27T09:58:41.000000Z","deleted_at":null}},{"id":24,"offender_id":28,"vehicle_id":1,"location":"Seke Road","reference":"CRM-27660","crime_id":2,"occurrence_time":"2025-02-03 12:45:53","status":"PENDING","created_at":"2025-02-03T10:45:55.000000Z","updated_at":"2025-02-03T10:45:55.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":28,"name":"John smith","id_number":"12345678","email":"h@Gmail. com","phone":"0776556554","license_number":"12345678","created_at":"2025-02-03T10:28:21.000000Z","updated_at":"2025-02-03T10:28:21.000000Z","deleted_at":null}},{"id":25,"offender_id":29,"vehicle_id":1,"location":"harare","reference":"CRM-41109","crime_id":2,"occurrence_time":"2025-02-06 14:48:30","status":"PENDING","created_at":"2025-02-06T12:48:31.000000Z","updated_at":"2025-02-06T12:48:31.000000Z","deleted_at":null,"crime":{"id":2,"category_id":1,"name":"Driving without Licence","description":"Driving without Licence","price":"50.00","created_at":"2025-01-06T07:08:36.000000Z","updated_at":"2025-01-06T07:08:36.000000Z","deleted_at":null},"offender":{"id":29,"name":"hdjdjjsjs","id_number":"537382","email":null,"phone":"24 6383829","license_number":"gshsj","created_at":"2025-02-06T12:47:49.000000Z","updated_at":"2025-02-06T12:47:49.000000Z","deleted_at":null}}]

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
      this.deletedAt, 
      this.crimes,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    make = json['make'];
    model = json['model'];
    color = json['color'];
    registrationNumber = json['registration_number'];
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
  String? make;
  String? model;
  String? color;
  String? registrationNumber;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Crimes>? crimes;
Data copyWith({  int? id,
  String? make,
  String? model,
  String? color,
  String? registrationNumber,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  List<Crimes>? crimes,
}) => Data(  id: id ?? this.id,
  make: make ?? this.make,
  model: model ?? this.model,
  color: color ?? this.color,
  registrationNumber: registrationNumber ?? this.registrationNumber,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
  crimes: crimes ?? this.crimes,
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
/// crime : {"id":1,"category_id":1,"name":"Red Robot","description":"Red Robot","price":"20.00","created_at":"2025-01-02T13:59:09.000000Z","updated_at":"2025-01-02T13:59:09.000000Z","deleted_at":null}
/// offender : {"id":1,"name":"Tapson Jim","id_number":"1234567890-w","email":null,"phone":"","license_number":"AEJ5142","created_at":"2025-01-02T13:25:04.000000Z","updated_at":"2025-01-02T13:25:04.000000Z","deleted_at":null}

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
      this.deletedAt, 
      this.crime, 
      this.offender,});

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
    crime = json['crime'] != null ? Crime.fromJson(json['crime']) : null;
    offender = json['offender'] != null ? Offender.fromJson(json['offender']) : null;
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
  Crime? crime;
  Offender? offender;
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
  Crime? crime,
  Offender? offender,
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
  crime: crime ?? this.crime,
  offender: offender ?? this.offender,
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
    if (crime != null) {
      map['crime'] = crime?.toJson();
    }
    if (offender != null) {
      map['offender'] = offender?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Tapson Jim"
/// id_number : "1234567890-w"
/// email : null
/// phone : ""
/// license_number : "AEJ5142"
/// created_at : "2025-01-02T13:25:04.000000Z"
/// updated_at : "2025-01-02T13:25:04.000000Z"
/// deleted_at : null

Offender offenderFromJson(String str) => Offender.fromJson(json.decode(str));
String offenderToJson(Offender data) => json.encode(data.toJson());
class Offender {
  Offender({
      this.id, 
      this.name, 
      this.idNumber, 
      this.email, 
      this.phone, 
      this.licenseNumber, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Offender.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    idNumber = json['id_number'];
    email = json['email'];
    phone = json['phone'];
    licenseNumber = json['license_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? name;
  String? idNumber;
  dynamic email;
  String? phone;
  String? licenseNumber;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
Offender copyWith({  int? id,
  String? name,
  String? idNumber,
  dynamic email,
  String? phone,
  String? licenseNumber,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Offender(  id: id ?? this.id,
  name: name ?? this.name,
  idNumber: idNumber ?? this.idNumber,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  licenseNumber: licenseNumber ?? this.licenseNumber,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['id_number'] = idNumber;
    map['email'] = email;
    map['phone'] = phone;
    map['license_number'] = licenseNumber;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
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

Crime crimeFromJson(String str) => Crime.fromJson(json.decode(str));
String crimeToJson(Crime data) => json.encode(data.toJson());
class Crime {
  Crime({
      this.id, 
      this.categoryId, 
      this.name, 
      this.description, 
      this.price, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt,});

  Crime.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
Crime copyWith({  int? id,
  int? categoryId,
  String? name,
  String? description,
  String? price,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Crime(  id: id ?? this.id,
  categoryId: categoryId ?? this.categoryId,
  name: name ?? this.name,
  description: description ?? this.description,
  price: price ?? this.price,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  deletedAt: deletedAt ?? this.deletedAt,
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
    return map;
  }

}