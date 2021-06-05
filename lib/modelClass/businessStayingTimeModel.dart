class BusinessStayingTime {
  double activeStay;
  double idleStay;
  String url;

  BusinessStayingTime({this.activeStay, this.idleStay, this.url});

  BusinessStayingTime.fromJson(Map<String, dynamic> json) {
    activeStay = json['active_stay'];
    idleStay = json['idle_stay'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active_stay'] = this.activeStay;
    data['idle_stay'] = this.idleStay;
    data['url'] = this.url;
    return data;
  }
}