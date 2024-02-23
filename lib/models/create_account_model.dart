class CreateAccountModel {
  int? userId;
  String? message;

  CreateAccountModel({this.userId, this.message});

  CreateAccountModel.fromJson(Map<String, dynamic> json) {
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
