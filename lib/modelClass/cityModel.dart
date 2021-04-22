class CityModelClass {
  int count;
  int pageSize;
  int current;
  List<Results> results;

  CityModelClass({this.count, this.pageSize, this.current, this.results});

  CityModelClass.fromJson(Map<String, dynamic> json) {
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
  String sId;
  int locationType;
  String name;
  Parent parent;

  Results({this.sId, this.locationType, this.name, this.parent});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    locationType = json['location_type'];
    name = json['name'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['location_type'] = this.locationType;
    data['name'] = this.name;
    if (this.parent != null) {
      data['parent'] = this.parent.toJson();
    }
    return data;
  }
}

class Parent {
  String sId;
  String name;

  Parent({this.sId, this.name});

  Parent.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}