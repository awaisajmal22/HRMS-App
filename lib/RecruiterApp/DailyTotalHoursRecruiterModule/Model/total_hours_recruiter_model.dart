import 'dart:convert';

List<AddDailyHoursRecruiterModel> AddDailyHoursRecruiterModelFromJson(
        String str) =>
    List<AddDailyHoursRecruiterModel>.from(
        json.decode(str).map((x) => AddDailyHoursRecruiterModel.fromJson(x)));

String AddDailyHoursRecruiterModelToJson(
        List<AddDailyHoursRecruiterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddDailyHoursRecruiterModel {
  int id;
  String jobSiteName;
  int jobsiteId;
  int hours;
  double parking;
  double generalexpence;
  String feefback;

  AddDailyHoursRecruiterModel({
    required this.id,
    required this.jobSiteName,
    required this.jobsiteId,
    required this.hours,
    required this.parking,
    required this.generalexpence,
    required this.feefback,
  });

  factory AddDailyHoursRecruiterModel.fromJson(Map<String, dynamic> json) =>
      AddDailyHoursRecruiterModel(
        id: json["id"],
        jobSiteName: json["jobSiteName"],
        jobsiteId: json["jobsiteId"],
        hours: json["hours"],
        parking: json["parking"]?.toDouble(),
        generalexpence: json["generalexpence"]?.toDouble(),
        feefback: json["feefback"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobSiteName": jobSiteName,
        "jobsiteId": jobsiteId,
        "hours": hours,
        "parking": parking,
        "generalexpence": generalexpence,
        "feefback": feefback,
      };
}
