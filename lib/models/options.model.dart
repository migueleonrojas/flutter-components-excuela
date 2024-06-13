// To parse this JSON data, do
//
//     final options = optionsFromJson(jsonString);

import 'dart:convert';

Options optionsFromJson(String str) => Options.fromJson(json.decode(str));

String optionsToJson(Options data) => json.encode(data.toJson());

class Options {
    String value;
    bool isCorrect;
    bool isCheked;

    Options({
        required this.value,
        required this.isCorrect,
        required this.isCheked
    });

    factory Options.fromJson(Map<String, dynamic> json) => Options(
        value: json["value"],
        isCorrect: json["isCorrect"],
        isCheked: json["isCheked"]
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "isCorrect": isCorrect,
        "isCheked": isCheked
    };
}
