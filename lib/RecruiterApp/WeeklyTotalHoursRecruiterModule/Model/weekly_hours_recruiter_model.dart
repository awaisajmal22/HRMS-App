import 'dart:convert';

String AddWeeklyHoursRecruiterModelToJson(
        List<AddWeeklyHoursRecruiterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddWeeklyHoursRecruiterModel {
  int jobsiteId;
  int hours;
  double parking;
  double generalexpence;
  String feedback;

  AddWeeklyHoursRecruiterModel({
    required this.jobsiteId,
    required this.hours,
    required this.parking,
    required this.generalexpence,
    required this.feedback,
  });

  factory AddWeeklyHoursRecruiterModel.fromJson(Map<String, dynamic> json) =>
      AddWeeklyHoursRecruiterModel(
        jobsiteId: json["jobsiteId"],
        hours: json["hours"],
        parking: json["parking"]?.toDouble(),
        generalexpence: json["generalexpence"]?.toDouble(),
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "jobsiteId": jobsiteId,
        "Thours": hours,
        "Parking": parking,
        "Genexpence": generalexpence,
        "Feedback": feedback,
      };
}
