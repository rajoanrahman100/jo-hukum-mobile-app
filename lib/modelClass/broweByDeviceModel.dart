class BrowseByDevice {
  int fromDesktop;
  int fromTablet;
  int fromMobile;
  String url;

  BrowseByDevice(
      {this.fromDesktop, this.fromTablet, this.fromMobile, this.url});

  BrowseByDevice.fromJson(Map<String, dynamic> json) {
    fromDesktop = json['from_desktop'];
    fromTablet = json['from_tablet'];
    fromMobile = json['from_mobile'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_desktop'] = this.fromDesktop;
    data['from_tablet'] = this.fromTablet;
    data['from_mobile'] = this.fromMobile;
    data['url'] = this.url;
    return data;
  }
}