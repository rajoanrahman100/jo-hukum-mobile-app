class SessionModel {
  Null endedAt;
  String userId;
  String sId;
  String ip;
  String state;
  String country;
  String deviceType;
  String createdAt;

  SessionModel(
      {this.endedAt,
        this.userId,
        this.sId,
        this.ip,
        this.state,
        this.country,
        this.deviceType,
        this.createdAt});

  SessionModel.fromJson(Map<String, dynamic> json) {
    endedAt = json['ended_at'];
    userId = json['user_id'];
    sId = json['_id'];
    ip = json['ip'];
    state = json['state'];
    country = json['country'];
    deviceType = json['device_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ended_at'] = this.endedAt;
    data['user_id'] = this.userId;
    data['_id'] = this.sId;
    data['ip'] = this.ip;
    data['state'] = this.state;
    data['country'] = this.country;
    data['device_type'] = this.deviceType;
    data['created_at'] = this.createdAt;
    return data;
  }
}