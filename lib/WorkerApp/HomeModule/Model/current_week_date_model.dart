import 'dart:convert';

CurrentWeekDateModel currentWeekDateModelFromJson(String str) => CurrentWeekDateModel.fromJson(json.decode(str));

String currentWeekDateModelToJson(CurrentWeekDateModel data) => json.encode(data.toJson());

class CurrentWeekDateModel {
    DateTime? startDate;
    DateTime? endDate;

    CurrentWeekDateModel({
        this.startDate,
       this.endDate,
    });

    factory CurrentWeekDateModel.fromJson(Map<String, dynamic> json) => CurrentWeekDateModel(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toJson() => {
        "startDate": startDate!.toIso8601String(),
        "endDate": endDate!.toIso8601String(),
    };
}