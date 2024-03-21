import 'dart:convert';

WeeklyWorkSummaryRecruiterByIdModel weeklyWorkSummaryRecruiterByIdModelFromJson(String str) => WeeklyWorkSummaryRecruiterByIdModel.fromJson(json.decode(str));

String weeklyWorkSummaryRecruiterByIdModelToJson(WeeklyWorkSummaryRecruiterByIdModel data) => json.encode(data.toJson());

class WeeklyWorkSummaryRecruiterByIdModel {
    dynamic? id;
    dynamic? jobSiteName;
    dynamic? jobsiteId;
    dynamic? hours;
    dynamic? parking;
    dynamic? generalexpence;
    dynamic? feefback;

    WeeklyWorkSummaryRecruiterByIdModel({
        this.id,
        this.jobSiteName,
        this.jobsiteId,
        this.hours,
        this.parking,
        this.generalexpence,
        this.feefback,
    });

    factory WeeklyWorkSummaryRecruiterByIdModel.fromJson(Map<String, dynamic> json) => WeeklyWorkSummaryRecruiterByIdModel(
        id: json["id"],
        jobSiteName: json["jobSiteName"],
        jobsiteId: json["jobsiteId"],
        hours: json["hours"],
        parking: json["parking"],
        generalexpence: json["generalexpence"],
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
