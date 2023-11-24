import 'dart:convert';

List<JobSiteRecruiterModel> JobSiteRecruiterModelFromJson(String str) =>
    List<JobSiteRecruiterModel>.from(
        json.decode(str).map((x) => JobSiteRecruiterModel.fromJson(x)));

String JobSiteRecruiterModelToJson(List<JobSiteRecruiterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobSiteRecruiterModel {
  int id;
  String value;

  JobSiteRecruiterModel({
    required this.id,
    required this.value,
  });

  factory JobSiteRecruiterModel.fromJson(Map<String, dynamic> json) =>
      JobSiteRecruiterModel(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
