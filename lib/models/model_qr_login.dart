class ModelQrLogin {
  String? password;
  String? email;

  ModelQrLogin({this.password, this.email});

  ModelQrLogin.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}
