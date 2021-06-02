class CtaClickCount {
  String sId;
  int fromDesktop;
  int fromMobile;

  CtaClickCount({this.sId, this.fromDesktop, this.fromMobile});

  CtaClickCount.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fromDesktop = json['from_desktop'];
    fromMobile = json['from_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['from_desktop'] = this.fromDesktop;
    data['from_mobile'] = this.fromMobile;
    return data;
  }
}