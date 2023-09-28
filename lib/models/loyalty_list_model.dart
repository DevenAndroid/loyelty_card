class LoyaltyListModel {
  bool? status;
  String? message;
  List<Data>? data;

  LoyaltyListModel({this.status, this.message, this.data});

  LoyaltyListModel.fromJson(Map<String, dynamic> json) {
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
  String? businessCategoryId;
  String? businessCategory;
  String? businessLogo;
  String? businessName;
  String? address;
  String? country;
  String? state;
  bool? paymentStatus;
  String? city;
  String? zipCode;
  bool? status;

  Data(
      {this.id,
        this.userId,
        this.businessCategoryId,
        this.businessCategory,
        this.businessLogo,
        this.businessName,
        this.address,
        this.country,
        this.state,
        this.paymentStatus,
        this.city,
        this.zipCode,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    businessCategoryId = json['business_category_id'];
    businessCategory = json['business_category'];
    businessLogo = json['business_logo'];
    businessName = json['business_name'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    paymentStatus = json['payment_status'];
    city = json['city'];
    zipCode = json['zip_code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['business_category_id'] = this.businessCategoryId;
    data['business_category'] = this.businessCategory;
    data['business_logo'] = this.businessLogo;
    data['business_name'] = this.businessName;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['payment_status'] = this.paymentStatus;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['status'] = this.status;
    return data;
  }
}
