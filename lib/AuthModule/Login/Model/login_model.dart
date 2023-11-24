import 'dart:convert';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String token;
    DateTime expiration;
    String email;
    List<String>? userRoles;
    dynamic phonenumber;
    String fname;
    String lname;
    String id;
    int timeSheettype;

    UserModel({
        required this.token,
        required this.expiration,
        required this.email,
        required this.userRoles,
        required this.phonenumber,
        required this.fname,
        required this.lname,
        required this.id,
        required this.timeSheettype,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"]??"",
        expiration: DateTime.parse(json["expiration"]?? DateTime.now().toIso8601String()),
        email: json["email"]??"",
        userRoles: json["userRoles"] != null ? List<String>.from(json["userRoles"].map((x) => x)): null,
        phonenumber: json["phonenumber"]??"",
        fname: json["fname"]??"",
        lname: json["lname"]??"",
        id: json["id"]??"",
        timeSheettype: json["timeSheettype"]?? 0,
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiration": expiration.toIso8601String(),
        "email": email,
        "userRoles": List<dynamic>.from(userRoles!.map((x) => x)),
        "phonenumber": phonenumber,
        "fname": fname,
        "lname": lname,
        "id": id,
        "timeSheettype": timeSheettype,
    };
}
