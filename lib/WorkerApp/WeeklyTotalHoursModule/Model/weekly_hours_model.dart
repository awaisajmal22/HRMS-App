import 'dart:convert';

String addWeeklyHoursModelToJson(List<AddWeeklyHoursModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddWeeklyHoursModel {
  int jobsiteId;
  int hours;
  double parking;
  double generalexpence;
  String feedback;

  AddWeeklyHoursModel({
    required this.jobsiteId,
    required this.hours,
    required this.parking,
    required this.generalexpence,
    required this.feedback,
  });

  factory AddWeeklyHoursModel.fromJson(Map<String, dynamic> json) =>
      AddWeeklyHoursModel(
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
