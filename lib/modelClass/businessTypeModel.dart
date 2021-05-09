class BusinessTypeModel {
  int count;
  int pageSize;
  int current;
  List<Results> results;

  BusinessTypeModel({this.count, this.pageSize, this.current, this.results});

  BusinessTypeModel.fromJson(Map<String, dynamic> json) {
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
  String description;
  String addedBy;
  Null addedByUser;
  String sId;
  String name;
  String slug;

  Results(
      {this.description,
        this.addedBy,
        this.addedByUser,
        this.sId,
        this.name,
        this.slug});

  Results.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    addedBy = json['added_by'];
    addedByUser = json['added_by_user'];
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['added_by'] = this.addedBy;
    data['added_by_user'] = this.addedByUser;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}