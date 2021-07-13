class UserInfoLogInResponse {
  String sId;
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  bool isActive;
  String dateJoined;
  int shopUid;
  int bookingUid;
  String token;

  UserInfoLogInResponse(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.mobileNumber,
        this.isActive,
        this.dateJoined,
        this.shopUid,
        this.bookingUid,
        this.token});

  UserInfoLogInResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    shopUid = json['shop_uid'];
    bookingUid = json['booking_uid'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    data['shop_uid'] = this.shopUid;
    data['booking_uid'] = this.bookingUid;
    data['token'] = this.token;
    return data;
  }
}