class MyBusinessListModel {
  int count;
  int pageSize;
  int current;
  List<Results> results;

  MyBusinessListModel({this.count, this.pageSize, this.current, this.results});

  MyBusinessListModel.fromJson(Map<String, dynamic> json) {
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
  Location location;
  String modifiedAt;
  var aggregateRating;
  String sId;
  String createdAt;
  String slug;
  String logo;
  String coverPhoto;

  Results(
      {this.location,
        this.modifiedAt,
        this.aggregateRating,
        this.sId,
        this.createdAt,
        this.slug,
        this.logo,
        this.coverPhoto});

  Results.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    modifiedAt = json['modified_at'];
    aggregateRating = json['aggregate_rating'];
    sId = json['_id'];
    createdAt = json['created_at'];
    slug = json['slug'];
    logo = json['logo'];
    coverPhoto = json['cover_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['modified_at'] = this.modifiedAt;
    data['aggregate_rating'] = this.aggregateRating;
    data['_id'] = this.sId;
    data['created_at'] = this.createdAt;
    data['slug'] = this.slug;
    data['logo'] = this.logo;
    data['cover_photo'] = this.coverPhoto;
    return data;
  }
}

class Location {
  Geo geo;
  String building;
  String businessName;
  String landMark;
  String location;
  String plusCode;

  Location(
      {this.geo,
        this.building,
        this.businessName,
        this.landMark,
        this.location,
        this.plusCode});

  Location.fromJson(Map<String, dynamic> json) {
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    building = json['building'];
    businessName = json['business_name'];
    landMark = json['land_mark'];
    location = json['location'];
    plusCode = json['plus_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    data['building'] = this.building;
    data['business_name'] = this.businessName;
    data['land_mark'] = this.landMark;
    data['location'] = this.location;
    data['plus_code'] = this.plusCode;
    return data;
  }
}

class Geo {
  String type;
  List<double> coordinates;

  Geo({this.type, this.coordinates});

  Geo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}