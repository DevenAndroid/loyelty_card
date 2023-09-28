class QRListModel {
  bool? status;
  String? message;
  List<Data>? data;

  QRListModel({this.status, this.message, this.data});

  QRListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? businessId;
  String? businessName;
  String? qrToken;
  String? description;
  int? noOfScans;
  String? name;
  bool? status;
  String? expireAt;
  int? offer;
  String? image;
  int? totalScans;
  List<QrSceanner>? qrSceanner;

  Data(
      {this.id,
        this.userId,
        this.businessId,
        this.businessName,
        this.qrToken,
        this.description,
        this.noOfScans,
        this.name,
        this.status,
        this.expireAt,
        this.offer,
        this.image,
        this.totalScans,
        this.qrSceanner});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    businessId = json['business_id'];
    businessName = json['business_name'];
    qrToken = json['qr_token'];
    description = json['description'];
    noOfScans = json['no_of_scans'];
    name = json['name'];
    status = json['status'];
    expireAt = json['expire_at'];
    offer = json['offer'];
    image = json['image'];
    totalScans = json['total_scans'];
    if (json['qrSceanner'] != null) {
      qrSceanner = <QrSceanner>[];
      json['qrSceanner'].forEach((v) {
        qrSceanner!.add(new QrSceanner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['business_id'] = this.businessId;
    data['business_name'] = this.businessName;
    data['qr_token'] = this.qrToken;
    data['description'] = this.description;
    data['no_of_scans'] = this.noOfScans;
    data['name'] = this.name;
    data['status'] = this.status;
    data['expire_at'] = this.expireAt;
    data['offer'] = this.offer;
    data['image'] = this.image;
    data['total_scans'] = this.totalScans;
    if (this.qrSceanner != null) {
      data['qrSceanner'] = this.qrSceanner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QrSceanner {
  int? id;
  int? qrCodeId;
  int? userId;
  String? name;
  String? email;
  String? dob;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  QrSceanner(
      {this.id,
        this.qrCodeId,
        this.userId,
        this.name,
        this.email,
        this.dob,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt});

  QrSceanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrCodeId = json['qr_code_id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qr_code_id'] = this.qrCodeId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
