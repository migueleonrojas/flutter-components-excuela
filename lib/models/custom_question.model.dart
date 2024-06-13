import 'dart:convert';

import 'package:widgets_components/models/options.model.dart';

List<CustomQuestion> customQuestionFromJson(String str) => List<CustomQuestion>.from(json.decode(str).map((x) => CustomQuestion.fromJson(x)));

String customQuestionToJson(List<CustomQuestion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomQuestion {
    String name;
    List<Options> options;

    CustomQuestion({
        required this.name,
        required this.options,
    });

    factory CustomQuestion.fromJson(Map<String, dynamic> json) => CustomQuestion(
        name: json["name"],
        options: List<Options>.from(json["options"].map((x) => Options.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
    };
}