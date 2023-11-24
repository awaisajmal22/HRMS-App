import 'dart:convert';

List<DailyWorkSummaryModel> dailyWorkSummaryModelFromJson(String str) => List<DailyWorkSummaryModel>.from(json.decode(str).map((x) => DailyWorkSummaryModel.fromJson(x)));

String dailyWorkSummaryModelToJson(List<DailyWorkSummaryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DailyWorkSummaryModel {
    int id;
    String jobSiteName;
    String startTime;
    String endTime;
    int hours;
    DateTime date;

    DailyWorkSummaryModel({
        required this.id,
        required this.jobSiteName,
        required this.startTime,
        required this.endTime,
        required this.hours,
        required this.date,
    });

    factory DailyWorkSummaryModel.fromJson(Map<String, dynamic> json) => DailyWorkSummaryModel(
        id: json["id"],
        jobSiteName: json["jobSiteName"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        hours: json["hours"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jobSiteName": jobSiteName,
        "startTime": startTime,
        "endTime": endTime,
        "hours": hours,
        "date": date.toIso8601String(),
    };
}



DailyWorkSummaryByIdModel dailyWorkSummaryByIdModelFromJson(String str) => DailyWorkSummaryByIdModel.fromJson(json.decode(str));

String dailyWorkSummaryByIdModelToJson(DailyWorkSummaryByIdModel data) => json.encode(data.toJson());

class DailyWorkSummaryByIdModel {
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

    DailyWorkSummaryByIdModel({
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

    factory DailyWorkSummaryByIdModel.fromJson(Map<String, dynamic> json) => DailyWorkSummaryByIdModel(
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
