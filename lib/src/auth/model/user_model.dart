class UserModel {
  int? statusCode;
  bool? sucess;
  Data? data;
  String? message;

  UserModel({this.statusCode, this.sucess, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    sucess = json['sucess'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['sucess'] = sucess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? email;
  String? fullName;
  String? mobileNumber;

  Data({this.email, this.fullName, this.mobileNumber});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['fullName'] = fullName;
    data['mobileNumber'] = mobileNumber;
    return data;
  }
}
