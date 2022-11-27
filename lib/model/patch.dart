import 'package:bloc_project/core/constants/app_constants.dart';

class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  Patch.fromJson(Map<String, dynamic> json) {
    small = json['small'] ?? AppConstants.noLinkSmall;
    large = json['large'] ?? AppConstants.noLinkLarge;
  }
}
