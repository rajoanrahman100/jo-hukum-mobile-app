class VisitorsCount {
  String url;
  int totalVisits;
  int uniqueVisits;

  VisitorsCount({this.url, this.totalVisits, this.uniqueVisits});

  VisitorsCount.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    totalVisits = json['total_visits'];
    uniqueVisits = json['unique_visits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['total_visits'] = this.totalVisits;
    data['unique_visits'] = this.uniqueVisits;
    return data;
  }
}