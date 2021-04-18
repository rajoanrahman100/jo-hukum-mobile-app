class TestClass {
  int took;
  bool timedOut;
  Shards sShards;
  Hits hits;
  Suggest suggest;

  TestClass({this.took, this.timedOut, this.sShards, this.hits, this.suggest});

  TestClass.fromJson(Map<String, dynamic> json) {
    took = json['took'];
    timedOut = json['timed_out'];
    sShards =
    json['_shards'] != null ? new Shards.fromJson(json['_shards']) : null;
    hits = json['hits'] != null ? new Hits.fromJson(json['hits']) : null;
    suggest =
    json['suggest'] != null ? new Suggest.fromJson(json['suggest']) : null;
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
    if (this.suggest != null) {
      data['suggest'] = this.suggest.toJson();
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
  var maxScore;
  List<HitsChild> hits;

  Hits({this.total, this.maxScore, this.hits});

  Hits.fromJson(Map<String, dynamic> json) {
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
    maxScore = json['max_score'];
    if (json['hits'] != null) {
      hits = new List<HitsChild>();
      json['hits'].forEach((v) {
        hits.add(new HitsChild.fromJson(v));
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

class HitsChild {
  String sIndex;
  String sType;
  String sId;
  var nScore;
  Source sSource;
  List<double> sort;

  HitsChild(
      {this.sIndex,
        this.sType,
        this.sId,
        this.nScore,
        this.sSource,
        this.sort});

  HitsChild.fromJson(Map<String, dynamic> json) {
    sIndex = json['_index'];
    sType = json['_type'];
    sId = json['_id'];
    nScore = json['_score'];
    sSource =
    json['_source'] != null ? new Source.fromJson(json['_source']) : null;
    sort = json['sort'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_index'] = this.sIndex;
    data['_type'] = this.sType;
    data['_id'] = this.sId;
    data['_score'] = this.nScore;
    if (this.sSource != null) {
      data['_source'] = this.sSource.toJson();
    }
    data['sort'] = this.sort;
    return data;
  }
}

class Source {
  String businessName;
  String building;
  String street;
  String landMark;
  String area;
  String postcode;
  String plusCode;
  List<double> geo;
  String location;
  String coverPhoto;
  String logo;
  int totalReviews;
  String aggregateRating;
  List<String> categories;
  List<MobileNo> mobileNo;

  Source(
      {this.businessName,
        this.building,
        this.street,
        this.landMark,
        this.area,
        this.postcode,
        this.plusCode,
        this.geo,
        this.location,
        this.coverPhoto,
        this.logo,
        this.totalReviews,
        this.aggregateRating,
        this.categories,
        this.mobileNo});

  Source.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    building = json['building'];
    street = json['street'];
    landMark = json['land_mark'];
    area = json['area'];
    postcode = json['postcode'];
    plusCode = json['plus_code'];
    geo = json['geo'].cast<double>();
    location = json['location'];
    coverPhoto = json['cover_photo'];
    logo = json['logo'];
    totalReviews = json['total_reviews'];
    aggregateRating = json['aggregate_rating'];
    categories = json['categories'].cast<String>();
    if (json['mobile_no'] != null) {
      mobileNo = new List<MobileNo>();
      json['mobile_no'].forEach((v) {
        mobileNo.add(new MobileNo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['building'] = this.building;
    data['street'] = this.street;
    data['land_mark'] = this.landMark;
    data['area'] = this.area;
    data['postcode'] = this.postcode;
    data['plus_code'] = this.plusCode;
    data['geo'] = this.geo;
    data['location'] = this.location;
    data['cover_photo'] = this.coverPhoto;
    data['logo'] = this.logo;
    data['total_reviews'] = this.totalReviews;
    data['aggregate_rating'] = this.aggregateRating;
    data['categories'] = this.categories;
    if (this.mobileNo != null) {
      data['mobile_no'] = this.mobileNo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MobileNo {
  String mobileNumber;
  bool verified;

  MobileNo({this.mobileNumber, this.verified});

  MobileNo.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    data['verified'] = this.verified;
    return data;
  }
}

class Suggest {
  List<Namesuggester> namesuggester;

  Suggest({this.namesuggester});

  Suggest.fromJson(Map<String, dynamic> json) {
    if (json['namesuggester'] != null) {
      namesuggester = new List<Namesuggester>();
      json['namesuggester'].forEach((v) {
        namesuggester.add(new Namesuggester.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.namesuggester != null) {
      data['namesuggester'] =
          this.namesuggester.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Namesuggester {
  String text;
  int offset;
  int length;
  List<dynamic> options;

  Namesuggester({this.text, this.offset, this.length, this.options});

  Namesuggester.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    offset = json['offset'];
    length = json['length'];
    if (json['options'] != null) {
      options = new List<dynamic>();
      json['options'].forEach((v) {
        options.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['offset'] = this.offset;
    data['length'] = this.length;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v).toList();
    }
    return data;
  }
}
