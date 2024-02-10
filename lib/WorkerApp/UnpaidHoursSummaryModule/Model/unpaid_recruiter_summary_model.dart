import 'dart:convert';

UnpaidWorkSummaryModel UnpaidWorkSummaryModelFromJson(
        String str) =>
    UnpaidWorkSummaryModel.fromJson(json.decode(str));

String UnpaidWorkSummaryModelToJson(
        UnpaidWorkSummaryModel data) =>
    json.encode(data.toJson());

class UnpaidWorkSummaryModel {
  int id;
  String jobSiteName;
  dynamic hours;
  dynamic date;
  dynamic parking;
  dynamic generalexpence;

  UnpaidWorkSummaryModel({
    required this.id,
    required this.jobSiteName,
    required this.hours,
    required this.date,
    required this.parking,
    required this.generalexpence,
  });

  factory UnpaidWorkSummaryModel.fromJson(Map<String, dynamic> json) =>
      UnpaidWorkSummaryModel(
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
