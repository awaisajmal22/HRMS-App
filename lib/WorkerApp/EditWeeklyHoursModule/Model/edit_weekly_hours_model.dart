import 'dart:convert';

String EditWeeklyHoursModelToJson(List<EditWeeklyHoursModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EditWeeklyHoursModel {
  int jobsiteId;
  int hours;
  double parking;
  double generalexpence;
  String feedback;

  EditWeeklyHoursModel({
    required this.jobsiteId,
    required this.hours,
    required this.parking,
    required this.generalexpence,
    required this.feedback,
  });

  factory EditWeeklyHoursModel.fromJson(Map<String, dynamic> json) =>
      EditWeeklyHoursModel(
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
