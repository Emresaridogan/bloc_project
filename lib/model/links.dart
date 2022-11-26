import 'patch.dart';

class Links {
  Patch? patch;
  String? webcast;
  String? article;
  String? wikipedia;

  Links({this.patch, this.webcast, this.article, this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? Patch.fromJson(json['patch']) : null;
    webcast = json['webcast'] ?? "";
    article = json['article'] ?? "";
    wikipedia = json['wikipedia'] ?? "";
  }
}
