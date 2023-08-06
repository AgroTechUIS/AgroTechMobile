class HttpResponseModel {
  late bool success;
  String? message;
  Map<String, dynamic>? body;

  HttpResponseModel({
    required this.success,
    this.message,
    this.body,
  });

  HttpResponseModel.fromJson(Map<String, dynamic> json) {
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
