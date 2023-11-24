import 'dart:convert';

DailyWorkSummaryRecruiterModel DailyWorkSummaryRecruiterModelFromJson(
        String str) =>
    DailyWorkSummaryRecruiterModel.fromJson(json.decode(str));

String DailyWorkSummaryRecruiterModelToJson(
        DailyWorkSummaryRecruiterModel data) =>
    json.encode(data.toJson());

class DailyWorkSummaryRecruiterModel {
  int? id;
  String? jobSiteName;
  String? startTime;
  String? endTime;
  int? hours;
  DateTime? date;
  double? genexpence;
  double? parking;

  DailyWorkSummaryRecruiterModel({
    this.id,
    this.jobSiteName,
    this.startTime,
    this.endTime,
    this.hours,
    this.date,
    this.genexpence,
    this.parking,
  });

  factory DailyWorkSummaryRecruiterModel.fromJson(Map<String, dynamic> json) =>
      DailyWorkSummaryRecruiterModel(
        id: json["id"],
        jobSiteName: json["jobSiteName"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        hours: json["hours"],
        date: DateTime.parse(json["date"]),
        genexpence: json["genexpence"],
        parking: json["parking"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobSiteName": jobSiteName,
        "startTime": startTime,
        "endTime": endTime,
        "hours": hours,
        "date": date?.toIso8601String(),
        "genexpence": genexpence,
        "parking": parking,
      };
}

DailyWorkSummaryRecruiterByIdModel DailyWorkSummaryRecruiterByIdModelFromJson(
        String str) =>
    DailyWorkSummaryRecruiterByIdModel.fromJson(json.decode(str));

String DailyWorkSummaryRecruiterByIdModelToJson(
        DailyWorkSummaryRecruiterByIdModel data) =>
    json.encode(data.toJson());

class DailyWorkSummaryRecruiterByIdModel {
  int? id;
  String? jobSiteName;
  int? jobsiteId;
  String? startTime;
  String? endTime;
  int? hours;
  DateTime? date;
  double? genexpence;
  double? parking;
  String? feefback;

  DailyWorkSummaryRecruiterByIdModel({
    this.id,
    this.jobSiteName,
    this.jobsiteId,
    this.startTime,
    this.endTime,
    this.hours,
    this.date,
    this.genexpence,
    this.parking,
    this.feefback,
  });

  factory DailyWorkSummaryRecruiterByIdModel.fromJson(
          Map<String, dynamic> json) =>
      DailyWorkSummaryRecruiterByIdModel(
        id: json["id"],
        jobSiteName: json["jobSiteName"],
        jobsiteId: json["jobsiteId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        hours: json["hours"],
        date: DateTime.parse(json["date"]),
        genexpence: json["genexpence"]?.toDouble(),
        parking: json["parking"]?.toDouble(),
        feefback: json["feefback"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobSiteName": jobSiteName,
        "jobsiteId": jobsiteId,
        "startTime": startTime,
        "endTime": endTime,
        "hours": hours,
        "date": date?.toIso8601String(),
        "genexpence": genexpence,
        "parking": parking,
        "feefback": feefback,
      };
}
