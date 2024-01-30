class ModelQrDetails {
  bool? status;
  String? message;
  Data? data;

  ModelQrDetails({this.status, this.message, this.data});

  ModelQrDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? token;
  String? name;
  String? email;
  int? stampsCollected;
  int? stampsRemaining;

  Data(
      {this.id,
        this.token,
        this.name,
        this.email,
        this.stampsCollected,
        this.stampsRemaining});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    stampsCollected = json['stamps_collected'];
    stampsRemaining = json['stamps_remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['stamps_collected'] = this.stampsCollected;
    data['stamps_remaining'] = this.stampsRemaining;
    return data;
  }
}
