// coverage:ignore-file

class HttpDeleteModel {
  late bool success;
  String? message;
  String? body;

  HttpDeleteModel({
    required this.success,
    this.message,
    this.body,
  });

  HttpDeleteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['body'] = body;
    return data;
  }
}
