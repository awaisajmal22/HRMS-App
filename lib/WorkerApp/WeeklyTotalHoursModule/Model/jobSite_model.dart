import 'dart:convert';

List<JobSiteModel> JobSiteModelFromJson(String str) => List<JobSiteModel>.from(json.decode(str).map((x) => JobSiteModel.fromJson(x)));

String JobSiteModelToJson(List<JobSiteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobSiteModel {
    int id;
    String value;

    JobSiteModel({
        required this.id,
        required this.value,
    });

    factory JobSiteModel.fromJson(Map<String, dynamic> json) => JobSiteModel(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}
