class VisitByRegion {
  int dhaka;
  String url;

  VisitByRegion({this.dhaka, this.url});

  VisitByRegion.fromJson(Map<String, dynamic> json) {
    dhaka = json['Dhaka'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Dhaka'] = this.dhaka;
    data['url'] = this.url;
    return data;
  }
}