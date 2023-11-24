import 'dart:convert';

WeeklyWorkSummaryRecruiterModel WeeklyWorkSummaryRecruiterModelFromJson(
        String str) =>
    WeeklyWorkSummaryRecruiterModel.fromJson(json.decode(str));

String WeeklyWorkSummaryRecruiterModelToJson(
        WeeklyWorkSummaryRecruiterModel data) =>
    json.encode(data.toJson());

class WeeklyWorkSummaryRecruiterModel {
  int id;
  String jobSiteName;
  int hours;
  DateTime date;
  double parking;
  double generalexpence;

  WeeklyWorkSummaryRecruiterModel({
    required this.id,
    required this.jobSiteName,
    required this.hours,
    required this.date,
    required this.parking,
    required this.generalexpence,
  });

  factory WeeklyWorkSummaryRecruiterModel.fromJson(Map<String, dynamic> json) =>
      WeeklyWorkSummaryRecruiterModel(
        id: json["id"],
        jobSiteName: json["jobSiteName"],
        hours: json["hours"],
        date: DateTime.parse(json["date"]),
        parking: json["parking"],
        generalexpence: json["generalexpence"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobSiteName": jobSiteName,
        "hours": hours,
        "date": date.toIso8601String(),
        "parking": parking,
        "generalexpence": generalexpence,
      };
}
