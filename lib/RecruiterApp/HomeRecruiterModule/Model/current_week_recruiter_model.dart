import 'dart:convert';

CurrentWeekRecruiterDateModel CurrentWeekRecruiterDateModelFromJson(
        String str) =>
    CurrentWeekRecruiterDateModel.fromJson(json.decode(str));

String CurrentWeekRecruiterDateModelToJson(
        CurrentWeekRecruiterDateModel data) =>
    json.encode(data.toJson());

class CurrentWeekRecruiterDateModel {
  DateTime? startDate;
  DateTime? endDate;

  CurrentWeekRecruiterDateModel({
    this.startDate,
    this.endDate,
  });

  factory CurrentWeekRecruiterDateModel.fromJson(Map<String, dynamic> json) =>
      CurrentWeekRecruiterDateModel(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "startDate": startDate!.toIso8601String(),
        "endDate": endDate!.toIso8601String(),
      };
}
