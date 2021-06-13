class MobileNumberModel{
  String key;
  String value;

  MobileNumberModel({this.key,this.value});

  MobileNumberModel.fromJson(Map<String, dynamic> json)
      :value = json['mobile_number'];

  Map<String, dynamic> toJson() {
    return {
      'mobile_number': value,
      //'value': value,
    };
  }
}