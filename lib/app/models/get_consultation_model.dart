// To parse this JSON data, do
//
//     final listUsers = listUsersFromJson(jsonString);

import 'dart:convert';

List<ListUser> listUsersFromJson(String str) => List<ListUser>.from(json.decode(str).map((x) => ListUser.fromJson(x)));

String listUsersToJson(List<ListUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListUser {
    final String? name;
    final String? emailAddress;
    final String? image;
    final String? specialisation;
    final DateTime? consultationDate;
    final DateTime? consultationEndTime;
    final String? id;

    ListUser({
        this.name,
        this.emailAddress,
        this.image,
        this.specialisation,
        this.consultationDate,
        this.consultationEndTime,
        this.id,
    });

    factory ListUser.fromJson(Map<String, dynamic> json) => ListUser(
        name: json["name"],
        emailAddress: json["email_address"],
        image: json["image"],
        specialisation: json["specialisation"],
        consultationDate: json["consultation_date"] == null ? null : DateTime.parse(json["consultation_date"]),
        consultationEndTime: json["consultation_end_time"] == null ? null : DateTime.parse(json["consultation_end_time"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email_address": emailAddress,
        "image": image,
        "specialisation": specialisation,
        "consultation_date": consultationDate?.toIso8601String(),
        "consultation_end_time": consultationEndTime?.toIso8601String(),
        "id": id,
    };
}
