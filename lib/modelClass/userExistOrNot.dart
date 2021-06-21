class UserExistOrNotModel {
  int count;
  int pageSize;
  int current;
  List<Results> results;

  UserExistOrNotModel({this.count, this.pageSize, this.current, this.results});

  UserExistOrNotModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pageSize = json['page_size'];
    current = json['current'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['page_size'] = this.pageSize;
    data['current'] = this.current;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String firstName;
  String lastName;
  bool isActive;
  String sId;
  String email;
  String mobileNumber;

  Results(
      {this.firstName,
        this.lastName,
        this.isActive,
        this.sId,
        this.email,
        this.mobileNumber});

  Results.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    isActive = json['is_active'];
    sId = json['_id'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['is_active'] = this.isActive;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}