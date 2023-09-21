class LoginModel {
  bool? status;
  String? message;
  String? authToken;
  Data? data;

  LoginModel({this.status, this.message, this.authToken, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    authToken = json['auth_token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['auth_token'] = this.authToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic location;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic statusPayment;
  dynamic profileImage;

  Data(
      {this.id,
        this.location,
        this.name,
        this.email,
        this.phone,
        this.statusPayment,
        this.profileImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    statusPayment = json['status_payment'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location'] = this.location;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status_payment'] = this.statusPayment;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
