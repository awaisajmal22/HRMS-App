import 'dart:convert';

List<WeeklyWorkSummaryModel> weeklyWorkSummaryModelFromJson(String str) => List<WeeklyWorkSummaryModel>.from(json.decode(str).map((x) => WeeklyWorkSummaryModel.fromJson(x)));

String weeklyWorkSummaryModelToJson(List<WeeklyWorkSummaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeeklyWorkSummaryModel {
    int id;
    String jobSiteName;
    int jobId;
    dynamic hours;
    dynamic date;
    dynamic parking;
    dynamic generalexpence;

    WeeklyWorkSummaryModel({
        required this.id,
        required this.jobSiteName,
        required this.jobId,
        required this.hours,
        required this.date,
        required this.parking,
        required this.generalexpence,
    });

    factory WeeklyWorkSummaryModel.fromJson(Map<String, dynamic> json) => WeeklyWorkSummaryModel(
        id: json["id"],
        jobSiteName: json["jobSiteName"],
        jobId: json["jobId"],
        hours: json["hours"],
        date: DateTime.parse(json["date"]),
        parking: json["parking"],
        generalexpence: json["generalexpence"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jobSiteName": jobSiteName,
        "jobId": jobId,
        "hours": hours,
        "date": date.toIso8601String(),
        "parking": parking,
        "generalexpence": generalexpence,
    };
}
