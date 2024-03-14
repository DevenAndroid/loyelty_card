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
  Null? name;
  bool? status;
  Null? expireAt;
  int? businessCategoryId;
  int? productCategoryId;
  String? textColor;
  String? backgroundColor;
  String? stamps;
  Null? offer;
  String? image;
  int? totalScans;
  List<QrSceanner>? qrSceanner;
  int? rewardId;
  Reward? reward;

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
      this.businessCategoryId,
      this.productCategoryId,
      this.textColor,
      this.backgroundColor,
      this.stamps,
      this.offer,
      this.image,
      this.totalScans,
      this.qrSceanner,
      this.rewardId,
      this.reward});

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
    businessCategoryId = json['business_category_id'];
    productCategoryId = json['product_category_id'];
    textColor = json['text_color'];
    backgroundColor = json['background_color'];
    stamps = json['stamps'];
    offer = json['offer'];
    image = json['image'];
    totalScans = json['total_scans'];
    if (json['qrSceanner'] != null) {
      qrSceanner = <QrSceanner>[];
      json['qrSceanner'].forEach((v) {
        qrSceanner!.add(new QrSceanner.fromJson(v));
      });
    }
    rewardId = json['reward_id'];
    reward =
        json['reward'] != null ? new Reward.fromJson(json['reward']) : null;
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
    data['business_category_id'] = this.businessCategoryId;
    data['product_category_id'] = this.productCategoryId;
    data['text_color'] = this.textColor;
    data['background_color'] = this.backgroundColor;
    data['stamps'] = this.stamps;
    data['offer'] = this.offer;
    data['image'] = this.image;
    data['total_scans'] = this.totalScans;
    if (this.qrSceanner != null) {
      data['qrSceanner'] = this.qrSceanner!.map((v) => v.toJson()).toList();
    }
    data['reward_id'] = this.rewardId;
    if (this.reward != null) {
      data['reward'] = this.reward!.toJson();
    }
    return data;
  }
}

class QrSceanner {
  int? id;
  int? qrCodeId;
  int? userId;
  String? memberId;
  Null? serialNumber;
  String? memberToken;
  String? name;
  String? email;
  String? dob;
  String? phoneNumber;
  int? noOfScans;
  int? stampsCollected;
  int? stampsRemaining;
  String? deviceToken;
  Null? deviceId;
  String? operatingSystem;
  String? createdAt;
  String? updatedAt;

  QrSceanner(
      {this.id,
      this.qrCodeId,
      this.userId,
      this.memberId,
      this.serialNumber,
      this.memberToken,
      this.name,
      this.email,
      this.dob,
      this.phoneNumber,
      this.noOfScans,
      this.stampsCollected,
      this.stampsRemaining,
      this.deviceToken,
      this.deviceId,
      this.operatingSystem,
      this.createdAt,
      this.updatedAt});

  QrSceanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrCodeId = json['qr_code_id'];
    userId = json['user_id'];
    memberId = json['member_id'];
    serialNumber = json['serial_number'];
    memberToken = json['member_token'];
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
    phoneNumber = json['phone_number'];
    noOfScans = json['no_of_scans'];
    stampsCollected = json['stamps_collected'];
    stampsRemaining = json['stamps_remaining'];
    deviceToken = json['device_token'];
    deviceId = json['device_id'];
    operatingSystem = json['operating_system'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qr_code_id'] = this.qrCodeId;
    data['user_id'] = this.userId;
    data['member_id'] = this.memberId;
    data['serial_number'] = this.serialNumber;
    data['member_token'] = this.memberToken;
    data['name'] = this.name;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['phone_number'] = this.phoneNumber;
    data['no_of_scans'] = this.noOfScans;
    data['stamps_collected'] = this.stampsCollected;
    data['stamps_remaining'] = this.stampsRemaining;
    data['device_token'] = this.deviceToken;
    data['device_id'] = this.deviceId;
    data['operating_system'] = this.operatingSystem;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Reward {
  int? id;
  int? userId;
  Null? points;
  String? rewards;
  Null? businessId;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Reward(
      {this.id,
      this.userId,
      this.points,
      this.rewards,
      this.businessId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Reward.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    points = json['points'];
    rewards = json['rewards'];
    businessId = json['business_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['points'] = this.points;
    data['rewards'] = this.rewards;
    data['business_id'] = this.businessId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
