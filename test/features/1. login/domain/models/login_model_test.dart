import 'package:agrotech/features/1.login/domain/models/login_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginModel', () {
    test('fromJson() should create a LoginModel from a map', () {
      final Map<String, dynamic> json = {
        "email": "email",
        "password": "password",
      };

      final response = LoginModel.fromJson(json);

      expect(response.email, "email");
      expect(response.password, "password");
    });

    test('toJson() should convert a LoginModel to a map', () {
      final model = LoginModel(
        email: "email",
        password: "password",
      );

      final json = model.toJson();
      expect(json["email"], "email");
      expect(json["password"], "password");
    });
  });
}
