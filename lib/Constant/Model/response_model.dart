// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    String status;
    String message;

    ResponseModel({
        required this.status,
        required this.message,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"] ?? '',
        message: json["message"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}