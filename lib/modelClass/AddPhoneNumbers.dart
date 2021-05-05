class AddPhoneNumberModel{
  String mobileNUmber;

  AddPhoneNumberModel({this.mobileNUmber});

  AddPhoneNumberModel.fromJson(Map<String, dynamic> json) {
    mobileNUmber = json['mobileNUmber'];
  }
}