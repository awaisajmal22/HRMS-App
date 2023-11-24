import 'dart:convert';

String EditWeeklyHoursRecruiterModelToJson(
        List<EditWeeklyHoursRecruiterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EditWeeklyHoursRecruiterModel {
  int jobsiteId;
  int hours;
  double parking;
  double generalexpence;
  String feedback;

  EditWeeklyHoursRecruiterModel({
    required this.jobsiteId,
    required this.hours,
    required this.parking,
    required this.generalexpence,
    required this.feedback,
  });

  factory EditWeeklyHoursRecruiterModel.fromJson(Map<String, dynamic> json) =>
      EditWeeklyHoursRecruiterModel(
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
