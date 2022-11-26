import 'failures.dart';
import 'links.dart';

class Launches {
  Links? links;
  String? staticFireDateUtc;
  bool? success;
  List<Failures>? failures;
  String? details;
  int? flightNumber;
  String? name;
  String? dateUtc;
  String? dateLocal;
  String? datePrecision;

  Launches({
    this.links,
    this.staticFireDateUtc,
    this.success,
    this.failures,
    this.details,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateLocal,
    this.datePrecision,
  });

  Launches.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    success = json['success'];
    if (json['failures'].length > 0) {
      failures = <Failures>[];
      json['failures'].forEach((v) {
        failures!.add(Failures.fromJson(v));
      });
    } else {
      failures = <Failures>[];

      Map map = {
        "failures": [
          {"time": 0, "reason": "null"}
        ]
      };
      map['failures'].forEach((v) {
        failures!.add(Failures.fromJson(v));
      });
    }
    details = json['details'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
  }
}
