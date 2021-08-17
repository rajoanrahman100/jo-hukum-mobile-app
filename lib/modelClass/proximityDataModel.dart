class ProximityDataModel {
  int took;
  bool timedOut;
  Shards sShards;
  Hits hits;

  ProximityDataModel({this.took, this.timedOut, this.sShards, this.hits});

  ProximityDataModel.fromJson(Map<String, dynamic> json) {
    took = json['took'];
    timedOut = json['timed_out'];
    sShards =
    json['_shards'] != null ? new Shards.fromJson(json['_shards']) : null;
    hits = json['hits'] != null ? new Hits.fromJson(json['hits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['took'] = this.took;
    data['timed_out'] = this.timedOut;
    if (this.sShards != null) {
      data['_shards'] = this.sShards.toJson();
    }
    if (this.hits != null) {
      data['hits'] = this.hits.toJson();
    }
    return data;
  }
}

class Shards {
  int total;
  int successful;
  int skipped;
  int failed;

  Shards({this.total, this.successful, this.skipped, this.failed});

  Shards.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    successful = json['successful'];
    skipped = json['skipped'];
    failed = json['failed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['successful'] = this.successful;
    data['skipped'] = this.skipped;
    data['failed'] = this.failed;
    return data;
  }
}

class Hits {
  Total total;
  double maxScore;
  List<ResultHits> hits;

  Hits({this.total, this.maxScore, this.hits});

  Hits.fromJson(Map<String, dynamic> json) {
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
    maxScore = json['max_score'];
    if (json['hits'] != null) {
      hits = new List<ResultHits>();
      json['hits'].forEach((v) {
        hits.add(new ResultHits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.total != null) {
      data['total'] = this.total.toJson();
    }
    data['max_score'] = this.maxScore;
    if (this.hits != null) {
      data['hits'] = this.hits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Total {
  int value;
  String relation;

  Total({this.value, this.relation});

  Total.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['relation'] = this.relation;
    return data;
  }
}

class ResultHits {
  String sIndex;
  String sType;
  String sId;
  double dScore;
  Source sSource;

  ResultHits({this.sIndex, this.sType, this.sId, this.dScore, this.sSource});

  ResultHits.fromJson(Map<String, dynamic> json) {
    sIndex = json['_index'];
    sType = json['_type'];
    sId = json['_id'];
    dScore = json['_score'];
    sSource =
    json['_source'] != null ? new Source.fromJson(json['_source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_index'] = this.sIndex;
    data['_type'] = this.sType;
    data['_id'] = this.sId;
    data['_score'] = this.dScore;
    if (this.sSource != null) {
      data['_source'] = this.sSource.toJson();
    }
    return data;
  }
}

class Source {
  String building;
  String street;
  String landMark;
  String area;
  String postcode;
  List<double> geo;
  String division;
  String city;
  String thana;

  Source(
      {this.building,
        this.street,
        this.landMark,
        this.area,
        this.postcode,
        this.geo,
        this.division,
        this.city,
        this.thana});

  Source.fromJson(Map<String, dynamic> json) {
    building = json['building'];
    street = json['street'];
    landMark = json['land_mark'];
    area = json['area'];
    postcode = json['postcode'];
    geo = json['geo'].cast<double>();
    division = json['division'];
    city = json['city'];
    thana = json['thana'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['building'] = this.building;
    data['street'] = this.street;
    data['land_mark'] = this.landMark;
    data['area'] = this.area;
    data['postcode'] = this.postcode;
    data['geo'] = this.geo;
    data['division'] = this.division;
    data['city'] = this.city;
    data['thana'] = this.thana;
    return data;
  }
}