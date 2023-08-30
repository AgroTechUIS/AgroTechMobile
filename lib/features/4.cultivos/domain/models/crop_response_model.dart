import 'dart:convert';
import 'dart:typed_data';

class CropResponseModel {
  final int? id;

  CropResponseModel({
    this.id,
  });

  Map<String, dynamic> toJson() => {"id": id};
}
