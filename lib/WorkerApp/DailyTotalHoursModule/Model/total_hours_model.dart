import 'dart:convert';

List<AddDailyHoursModel> addDailyHoursModelFromJson(String str) => List<AddDailyHoursModel>.from(json.decode(str).map((x) => AddDailyHoursModel.fromJson(x)));

String addDailyHoursModelToJson(List<AddDailyHoursModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddDailyHoursModel {
    int id;
    String jobSiteName;
    int jobsiteId;
    int hours;
    double parking;
    double generalexpence;
    String feefback;

    AddDailyHoursModel({
        required this.id,
        required this.jobSiteName,
        required this.jobsiteId,
        required this.hours,
        required this.parking,
        required this.generalexpence,
        required this.feefback,
    });

    factory AddDailyHoursModel.fromJson(Map<String, dynamic> json) => AddDailyHoursModel(
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
