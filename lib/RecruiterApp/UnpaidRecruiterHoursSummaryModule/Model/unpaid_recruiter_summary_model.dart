import 'dart:convert';

UnpaidRecruiterWorkSummaryModel UnpaidRecruiterWorkSummaryModelFromJson(
        String str) =>
    UnpaidRecruiterWorkSummaryModel.fromJson(json.decode(str));

String UnpaidRecruiterWorkSummaryModelToJson(
        UnpaidRecruiterWorkSummaryModel data) =>
    json.encode(data.toJson());

class UnpaidRecruiterWorkSummaryModel {
  int id;
  String jobSiteName;
  dynamic hours;
  dynamic date;
  dynamic parking;
  dynamic generalexpence;

  UnpaidRecruiterWorkSummaryModel({
    required this.id,
    required this.jobSiteName,
    required this.hours,
    required this.date,
    required this.parking,
    required this.generalexpence,
  });

  factory UnpaidRecruiterWorkSummaryModel.fromJson(Map<String, dynamic> json) =>
      UnpaidRecruiterWorkSummaryModel(
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
