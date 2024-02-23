class LoginModel {
  int? userId;
  String? message;

  LoginModel({this.userId, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['message'] = this.message;
    return data;
  }
}
