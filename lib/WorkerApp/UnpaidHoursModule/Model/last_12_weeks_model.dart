import 'dart:convert';

List<Last12WeeksModel> last12WeeksModelFromJson(String str) => List<Last12WeeksModel>.from(json.decode(str).map((x) => Last12WeeksModel.fromJson(x)));

String last12WeeksModelToJson(List<Last12WeeksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Last12WeeksModel {
    int? weekNumber;
    List<DateTime>? dates;

    Last12WeeksModel({
        this.weekNumber,
        this.dates,
    });

    factory Last12WeeksModel.fromJson(Map<String, dynamic> json) => Last12WeeksModel(
        weekNumber: json["weekNumber"],
        dates: json["dates"] == null ? [] : List<DateTime>.from(json["dates"]!.map((x) => DateTime.parse(x))),
    );

    Map<String, dynamic> toJson() => {
        "weekNumber": weekNumber,
        "dates": dates == null ? [] : List<dynamic>.from(dates!.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
    };
}
