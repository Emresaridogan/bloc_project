class Failures {
  int? time;
  String? reason;

  Failures({this.time, this.reason});

  Failures.fromJson(Map<String, dynamic> json) {
    time = json['time'] ?? 0;
    reason = json['reason'] ?? "";
  }
}
