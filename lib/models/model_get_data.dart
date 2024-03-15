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
  Reward? reward;

  Data(
      {this.id,
      this.token,
      this.name,
      this.email,
      this.stampsCollected,
      this.stampsRemaining,
      this.reward});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'];
    email = json['email'];
    stampsCollected = json['stamps_collected'];
    stampsRemaining = json['stamps_remaining'];
    reward =
        json['reward'] != null ? new Reward.fromJson(json['reward']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    data['stamps_collected'] = this.stampsCollected;
    data['stamps_remaining'] = this.stampsRemaining;
    if (this.reward != null) {
      data['reward'] = this.reward!.toJson();
    }
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
