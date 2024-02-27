
import 'dart:convert';

WorkersListModel WorkersListModelFromJson(String str) => WorkersListModel.fromJson(json.decode(str));

String WorkersListModelToJson(WorkersListModel data) => json.encode(data.toJson());

class WorkersListModel {
    dynamic id;
    dynamic firstName;
    dynamic lastName;
    dynamic timeSheettype;

    WorkersListModel({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.timeSheettype,
    });

    factory WorkersListModel.fromJson(Map<String, dynamic> json) => WorkersListModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        timeSheettype: json["timeSheettype"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "timeSheettype": timeSheettype,
    };
}
