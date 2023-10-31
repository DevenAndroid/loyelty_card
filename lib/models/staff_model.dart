class ModelStaffList {
  bool? status;
  String? message;
  List<Data>? data;

  ModelStaffList({this.status, this.message, this.data});

  ModelStaffList.fromJson(Map<String, dynamic> json) {
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
  String? staffName;
  String? staffEmail;
  String? staffDob;
  String? staffPhoneNumber;
  int? status;

  Data(
      {this.id,
        this.userId,
        this.staffName,
        this.staffEmail,
        this.staffDob,
        this.staffPhoneNumber,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    staffName = json['staff_name'];
    staffEmail = json['staff_email'];
    staffDob = json['staff_dob'];
    staffPhoneNumber = json['staff_phone_number'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['staff_name'] = this.staffName;
    data['staff_email'] = this.staffEmail;
    data['staff_dob'] = this.staffDob;
    data['staff_phone_number'] = this.staffPhoneNumber;
    data['status'] = this.status;
    return data;
  }
}
