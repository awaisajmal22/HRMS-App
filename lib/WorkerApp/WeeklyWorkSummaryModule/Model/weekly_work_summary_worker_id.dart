import 'dart:convert';

WeeklyWorkSummaryWorkerByIdModel WeeklyWorkSummaryWorkerByIdModelFromJson(String str) => WeeklyWorkSummaryWorkerByIdModel.fromJson(json.decode(str));

String WeeklyWorkSummaryWorkerByIdModelToJson(WeeklyWorkSummaryWorkerByIdModel data) => json.encode(data.toJson());

class WeeklyWorkSummaryWorkerByIdModel {
    dynamic? id;
    dynamic? jobSiteName;
    dynamic? jobsiteId;
    dynamic? hours;
    dynamic? parking;
    dynamic? generalexpence;
    dynamic? feefback;

    WeeklyWorkSummaryWorkerByIdModel({
        this.id,
        this.jobSiteName,
        this.jobsiteId,
        this.hours,
        this.parking,
        this.generalexpence,
        this.feefback,
    });

    factory WeeklyWorkSummaryWorkerByIdModel.fromJson(Map<String, dynamic> json) => WeeklyWorkSummaryWorkerByIdModel(
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
