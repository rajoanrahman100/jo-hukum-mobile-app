/// location : {"geo":{"type":"Point","coordinates":[90.43081249999994,23.713062500000007]},"business_name":"Islamia General Hospital","building":"","street":"Dholpur Road","land_mark":"25, North Jatrabari, Dholpur Road, Saydabad, Dhaka. (North Of Jatrabari Bridge)","area":"saidabad","postcode":"Dhaka-1100","plus_code":"PC7J+68 Dhaka","division":{"_id":"5bb608df41533c632889eb8c","name":"Dhaka"},"city":{"_id":"5bb608df41533c632889eb8d","name":"Dhaka"},"location":{"_id":"5bb608e041533c632889eba3","name":"Jatrabari"}}
/// contact : {"title":"Mrs.","name":"Islamia General Hospital","designation":"General Hospital","email":"","mobile_no":"","mobile_numbers":[],"landline_no":"","fax_no":"","website":""}
/// hours_of_operation : {"monday":{"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false},"tuesday":{"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false},"wednesday":{"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false},"thursday":{"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false},"friday":{"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false},"saturday":{"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false},"sunday":{"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false},"display_hours_of_operation":true}
/// professional_associations : []
/// certifications : []
/// photos : []
/// suggested_photos : []
/// videos : []
/// accepted_payment_methods : [{"_id":"5bac9d1d41533c7d7df4b646","name":"Other"},{"_id":"5bb5bead41533c2ef77eacc8","name":"Cash"}]
/// keywords : [{"_id":"5bacade841533c0b123624bd","name":"Hospitals"},{"_id":"5bacaf1741533c0b123624e3","name":"Private Hospitals\r"},{"_id":"5bacaf1741533c0b123624e2","name":"Multispeciality Hospitals\r"}]
/// tags : []
/// reviewed_at : null
/// approved_at : null
/// rejected_at : null
/// modified_at : "2018-10-15T10:35:52.532Z"
/// modified_by_owner_at : null
/// deleted_at : null
/// deleted_by_owner_at : null
/// status : 1
/// total_reviews : 0
/// aggregate_rating : 0
/// _id : "5bc46d8841533c14085157a4"
/// description : "hospital"
/// year_of_establishment : 2011
/// annual_turnover : null
/// no_of_employees : ""
/// logo : "uploads/2018/10/15/islamia-general-hospital_logo_20181015_103552.jpg"
/// cover_photo : "uploads/2018/10/15/islamia-general-hospital_cover_photo_20181015_103552.jpeg"
/// embed_video : ""
/// created_at : "2018-10-15T10:35:52.497Z"
/// added_id : "5bb5b8bd41533c2ef77eacaa"
/// edit_by : null
/// reviewed_by : null
/// approved_by : null
/// rejected_by : null
/// faqs : []
/// reviews : []

class BusinessInfoDataModel {
  Llocation _llocation;
  Contact _contact;
  Hours_of_operation _hoursOfOperation;
  List<dynamic> _professionalAssociations;
  List<dynamic> _certifications;
  List<Photos> _photos;
  List<dynamic> _suggestedPhotos;
  List<dynamic> _videos;
  List<Accepted_payment_methods> _acceptedPaymentMethods;
  List<Keywords> _keywords;
  List<dynamic> _tags;
  dynamic _reviewedAt;
  dynamic _approvedAt;
  dynamic _rejectedAt;
  String _modifiedAt;
  dynamic _modifiedByOwnerAt;
  dynamic _deletedAt;
  dynamic _deletedByOwnerAt;
  int _status;
  int _totalReviews;
  var _aggregateRating;
  String _id;
  String _description;
  int _yearOfEstablishment;
  dynamic _annualTurnover;
  String _noOfEmployees;
  String _logo;
  String _coverPhoto;
  String _embedVideo;
  String _createdAt;
  String _addedId;
  dynamic _editBy;
  dynamic _reviewedBy;
  dynamic _approvedBy;
  dynamic _rejectedBy;
  List<dynamic> _faqs;
  List<Reviews> _reviews;

  Llocation get llocation => _llocation;
  Contact get contact => _contact;
  Hours_of_operation get hoursOfOperation => _hoursOfOperation;
  List<dynamic> get professionalAssociations => _professionalAssociations;
  List<dynamic> get certifications => _certifications;
  List<Photos> get photos => _photos;
  List<dynamic> get suggestedPhotos => _suggestedPhotos;
  List<dynamic> get videos => _videos;
  List<Accepted_payment_methods> get acceptedPaymentMethods => _acceptedPaymentMethods;
  List<Keywords> get keywords => _keywords;
  List<dynamic> get tags => _tags;
  dynamic get reviewedAt => _reviewedAt;
  dynamic get approvedAt => _approvedAt;
  dynamic get rejectedAt => _rejectedAt;
  String get modifiedAt => _modifiedAt;
  dynamic get modifiedByOwnerAt => _modifiedByOwnerAt;
  dynamic get deletedAt => _deletedAt;
  dynamic get deletedByOwnerAt => _deletedByOwnerAt;
  int get status => _status;
  int get totalReviews => _totalReviews;
  dynamic get aggregateRating => _aggregateRating;
  String get id => _id;
  String get description => _description;
  int get yearOfEstablishment => _yearOfEstablishment;
  dynamic get annualTurnover => _annualTurnover;
  String get noOfEmployees => _noOfEmployees;
  String get logo => _logo;
  String get coverPhoto => _coverPhoto;
  String get embedVideo => _embedVideo;
  String get createdAt => _createdAt;
  String get addedId => _addedId;
  dynamic get editBy => _editBy;
  dynamic get reviewedBy => _reviewedBy;
  dynamic get approvedBy => _approvedBy;
  dynamic get rejectedBy => _rejectedBy;
  List<dynamic> get faqs => _faqs;
  List<Reviews> get reviews => _reviews;

  BusinessInfoDataModel({
      Llocation llocation,
      Contact contact,
      Hours_of_operation hoursOfOperation,
      List<dynamic> professionalAssociations,
      List<dynamic> certifications,
      List<Photos> photos,
      List<dynamic> suggestedPhotos,
      List<dynamic> videos,
      List<Accepted_payment_methods> acceptedPaymentMethods,
      List<Keywords> keywords,
      List<dynamic> tags,
      dynamic reviewedAt,
      dynamic approvedAt,
      dynamic rejectedAt,
      String modifiedAt,
      dynamic modifiedByOwnerAt,
      dynamic deletedAt,
      dynamic deletedByOwnerAt,
      int status,
      int totalReviews,
      dynamic aggregateRating,
      String id,
      String description,
      int yearOfEstablishment,
      dynamic annualTurnover,
      String noOfEmployees,
      String logo,
      String coverPhoto,
      String embedVideo,
      String createdAt,
      String addedId,
      dynamic editBy,
      dynamic reviewedBy,
      dynamic approvedBy,
      dynamic rejectedBy,
      List<dynamic> faqs,
      List<Reviews> reviews}){
    _llocation = llocation;
    _contact = contact;
    _hoursOfOperation = hoursOfOperation;
    _professionalAssociations = professionalAssociations;
    _certifications = certifications;
    _photos = photos;
    _suggestedPhotos = suggestedPhotos;
    _videos = videos;
    _acceptedPaymentMethods = acceptedPaymentMethods;
    _keywords = keywords;
    _tags = tags;
    _reviewedAt = reviewedAt;
    _approvedAt = approvedAt;
    _rejectedAt = rejectedAt;
    _modifiedAt = modifiedAt;
    _modifiedByOwnerAt = modifiedByOwnerAt;
    _deletedAt = deletedAt;
    _deletedByOwnerAt = deletedByOwnerAt;
    _status = status;
    _totalReviews = totalReviews;
    _aggregateRating = aggregateRating;
    _id = id;
    _description = description;
    _yearOfEstablishment = yearOfEstablishment;
    _annualTurnover = annualTurnover;
    _noOfEmployees = noOfEmployees;
    _logo = logo;
    _coverPhoto = coverPhoto;
    _embedVideo = embedVideo;
    _createdAt = createdAt;
    _addedId = addedId;
    _editBy = editBy;
    _reviewedBy = reviewedBy;
    _approvedBy = approvedBy;
    _rejectedBy = rejectedBy;
    _faqs = faqs;
    _reviews = reviews;
}

  BusinessInfoDataModel.fromJson(dynamic json) {
    _llocation = json["location"] != null ? Llocation.fromJson(json["location"]) : null;
    _contact = json["contact"] != null ? Contact.fromJson(json["contact"]) : null;
    _hoursOfOperation = json["hours_of_operation"] != null ? Hours_of_operation.fromJson(json["hours_of_operation"]) : null;
    if (json["professionalAssociations"] != null) {
      _professionalAssociations = [];
      json["professionalAssociations"].forEach((v) {
        _professionalAssociations.add(v);
      });
    }
    if (json["certifications"] != null) {
      _certifications = [];
      json["certifications"].forEach((v) {
        _certifications.add(v);
      });
    }
    if (json["photos"] != null) {
      _photos = [];
      json["photos"].forEach((v) {
        _photos.add(Photos.fromJson(v));
      });
    }
    if (json["suggestedPhotos"] != null) {
      _suggestedPhotos = [];
      json["suggestedPhotos"].forEach((v) {
        _suggestedPhotos.add(v);
      });
    }
    if (json["videos"] != null) {
      _videos = [];
      json["videos"].forEach((v) {
        _videos.add(v);
      });
    }
    if (json["accepted_payment_methods"] != null) {
      _acceptedPaymentMethods = [];
      json["accepted_payment_methods"].forEach((v) {
        _acceptedPaymentMethods.add(Accepted_payment_methods.fromJson(v));
      });
    }
    if (json["keywords"] != null) {
      _keywords = [];
      json["keywords"].forEach((v) {
        _keywords.add(Keywords.fromJson(v));
      });
    }
    if (json["tags"] != null) {
      _tags = [];
      json["tags"].forEach((v) {
        _tags.add(v);
      });
    }
    _reviewedAt = json["reviewedAt"];
    _approvedAt = json["approvedAt"];
    _rejectedAt = json["rejectedAt"];
    _modifiedAt = json["modifiedAt"];
    _modifiedByOwnerAt = json["modifiedByOwnerAt"];
    _deletedAt = json["deletedAt"];
    _deletedByOwnerAt = json["deletedByOwnerAt"];
    _status = json["status"];
    _totalReviews = json["total_reviews"];
    _aggregateRating = json["aggregate_rating"];
    _id = json["Id"];
    _description = json["description"];
    _yearOfEstablishment = json["yearOfEstablishment"];
    _annualTurnover = json["annualTurnover"];
    _noOfEmployees = json["noOfEmployees"];
    _logo = json["logo"];
    _coverPhoto = json["cover_photo"];
    _embedVideo = json["embedVideo"];
    _createdAt = json["createdAt"];
    _addedId = json["addedId"];
    _editBy = json["editBy"];
    _reviewedBy = json["reviewedBy"];
    _approvedBy = json["approvedBy"];
    _rejectedBy = json["rejectedBy"];
    if (json["faqs"] != null) {
      _faqs = [];
      json["faqs"].forEach((v) {
        _faqs.add(v);
      });
    }
    if (json["reviews"] != null) {
      _reviews = [];
      json["reviews"].forEach((v) {
        _reviews.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_llocation != null) {
      map["location"] = _llocation.toJson();
    }
    if (_contact != null) {
      map["contact"] = _contact.toJson();
    }
    if (_hoursOfOperation != null) {
      map["hours_of_operation"] = _hoursOfOperation.toJson();
    }
    if (_professionalAssociations != null) {
      map["professionalAssociations"] = _professionalAssociations.map((v) => v.toJson()).toList();
    }
    if (_certifications != null) {
      map["certifications"] = _certifications.map((v) => v.toJson()).toList();
    }
    if (_photos != null) {
      map["photos"] = _photos.map((v) => v.toJson()).toList();
    }
    if (_suggestedPhotos != null) {
      map["suggestedPhotos"] = _suggestedPhotos.map((v) => v.toJson()).toList();
    }
    if (_videos != null) {
      map["videos"] = _videos.map((v) => v.toJson()).toList();
    }
    if (_acceptedPaymentMethods != null) {
      map["accepted_payment_methods"] = _acceptedPaymentMethods.map((v) => v.toJson()).toList();
    }
    if (_keywords != null) {
      map["keywords"] = _keywords.map((v) => v.toJson()).toList();
    }
    if (_tags != null) {
      map["tags"] = _tags.map((v) => v.toJson()).toList();
    }
    map["reviewedAt"] = _reviewedAt;
    map["approvedAt"] = _approvedAt;
    map["rejectedAt"] = _rejectedAt;
    map["modifiedAt"] = _modifiedAt;
    map["modifiedByOwnerAt"] = _modifiedByOwnerAt;
    map["deletedAt"] = _deletedAt;
    map["deletedByOwnerAt"] = _deletedByOwnerAt;
    map["status"] = _status;
    map["total_reviews"] = _totalReviews;
    map["aggregate_rating"] = _aggregateRating;
    map["Id"] = _id;
    map["description"] = _description;
    map["yearOfEstablishment"] = _yearOfEstablishment;
    map["annualTurnover"] = _annualTurnover;
    map["noOfEmployees"] = _noOfEmployees;
    map["logo"] = _logo;
    map["cover_photo"] = _coverPhoto;
    map["embedVideo"] = _embedVideo;
    map["createdAt"] = _createdAt;
    map["addedId"] = _addedId;
    map["editBy"] = _editBy;
    map["reviewedBy"] = _reviewedBy;
    map["approvedBy"] = _approvedBy;
    map["rejectedBy"] = _rejectedBy;
    if (_faqs != null) {
      map["faqs"] = _faqs.map((v) => v.toJson()).toList();
    }
    if (_reviews != null) {
      map["reviews"] = _reviews.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Reviews {
  String comment;
  String sId;
  String addedById;
  String addedBy;
  int rating;
  String businessId;
  String reviewedAt;
  int iV;

  Reviews(
      {this.comment,
        this.sId,
        this.addedById,
        this.addedBy,
        this.rating,
        this.businessId,
        this.reviewedAt,
        this.iV});

  Reviews.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    sId = json['_id'];
    addedById = json['added_by_id'];
    addedBy = json['added_by'];
    rating = json['rating'];
    businessId = json['business_id'];
    reviewedAt = json['reviewed_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['_id'] = this.sId;
    data['added_by_id'] = this.addedById;
    data['added_by'] = this.addedBy;
    data['rating'] = this.rating;
    data['business_id'] = this.businessId;
    data['reviewed_at'] = this.reviewedAt;
    data['__v'] = this.iV;
    return data;
  }
}

/// _id : "5bacade841533c0b123624bd"
/// name : "Hospitals"

class Keywords {
  String _id;
  String _name;

  String get id => _id;
  String get name => _name;

  Keywords({
      String id,
      String name}){
    _id = id;
    _name = name;
}

  Keywords.fromJson(dynamic json) {
    _id = json["Id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["name"] = _name;
    return map;
  }

}

/// _id : "5bac9d1d41533c7d7df4b646"
/// name : "Other"

class Accepted_payment_methods {
  String _id;
  String _name;

  String get id => _id;
  String get name => _name;

  Accepted_payment_methods({
      String id,
      String name}){
    _id = id;
    _name = name;
}

  Accepted_payment_methods.fromJson(dynamic json) {
    _id = json["Id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["name"] = _name;
    return map;
  }

}

class Photos{

  String approved_at;
  String _id;
  String image;
  String added_at;

  String get _approved_at => approved_at;
  String get id => _id;
  String get _image => image;
  String get _added_at => added_at;

  Photos({String approved_at,String id,String image,String added_at}){
    approved_at=approved_at;_id=id;image=image;added_at=added_at;
  }

  Photos.fromJson(dynamic json) {
    approved_at = json["approved_at"];
    _id = json["_id"];
    image = json["image"];
    added_at = json["added_at"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["approved_at"] = approved_at;
    map["_id"] = _id;
    map["image"] = image;
    map["added_at"] = added_at;
    return map;
  }
}

/// monday : {"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false}
/// tuesday : {"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false}
/// wednesday : {"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false}
/// thursday : {"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false}
/// friday : {"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false}
/// saturday : {"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false}
/// sunday : {"open_from":"09:00:00","open_till":"17:00:00","leisure_start":null,"leisure_end":null,"open_24h":true,"close":false}
/// display_hours_of_operation : true

class Hours_of_operation {
  Monday _monday;
  Tuesday _tuesday;
  Wednesday _wednesday;
  Thursday _thursday;
  Friday _friday;
  Saturday _saturday;
  Sunday _sunday;
  bool _displayHoursOfOperation;

  Monday get monday => _monday;
  Tuesday get tuesday => _tuesday;
  Wednesday get wednesday => _wednesday;
  Thursday get thursday => _thursday;
  Friday get friday => _friday;
  Saturday get saturday => _saturday;
  Sunday get sunday => _sunday;
  bool get displayHoursOfOperation => _displayHoursOfOperation;

  Hours_of_operation({
      Monday monday,
      Tuesday tuesday,
      Wednesday wednesday,
      Thursday thursday,
      Friday friday,
      Saturday saturday,
      Sunday sunday,
      bool displayHoursOfOperation}){
    _monday = monday;
    _tuesday = tuesday;
    _wednesday = wednesday;
    _thursday = thursday;
    _friday = friday;
    _saturday = saturday;
    _sunday = sunday;
    _displayHoursOfOperation = displayHoursOfOperation;
}

  Hours_of_operation.fromJson(dynamic json) {
    _monday = json["monday"] != null ? Monday.fromJson(json["monday"]) : null;
    _tuesday = json["tuesday"] != null ? Tuesday.fromJson(json["tuesday"]) : null;
    _wednesday = json["wednesday"] != null ? Wednesday.fromJson(json["wednesday"]) : null;
    _thursday = json["thursday"] != null ? Thursday.fromJson(json["thursday"]) : null;
    _friday = json["friday"] != null ? Friday.fromJson(json["friday"]) : null;
    _saturday = json["saturday"] != null ? Saturday.fromJson(json["saturday"]) : null;
    _sunday = json["sunday"] != null ? Sunday.fromJson(json["sunday"]) : null;
    _displayHoursOfOperation = json["displayHoursOfOperation"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_monday != null) {
      map["monday"] = _monday.toJson();
    }
    if (_tuesday != null) {
      map["tuesday"] = _tuesday.toJson();
    }
    if (_wednesday != null) {
      map["wednesday"] = _wednesday.toJson();
    }
    if (_thursday != null) {
      map["thursday"] = _thursday.toJson();
    }
    if (_friday != null) {
      map["friday"] = _friday.toJson();
    }
    if (_saturday != null) {
      map["saturday"] = _saturday.toJson();
    }
    if (_sunday != null) {
      map["sunday"] = _sunday.toJson();
    }
    map["displayHoursOfOperation"] = _displayHoursOfOperation;
    return map;
  }

}

/// open_from : "09:00:00"
/// open_till : "17:00:00"
/// leisure_start : null
/// leisure_end : null
/// open_24h : true
/// close : false

class Sunday {
  String _openFrom;
  String _openTill;
  dynamic _leisureStart;
  dynamic _leisureEnd;
  bool _open24h;
  bool _close;

  String get openFrom => _openFrom;
  String get openTill => _openTill;
  dynamic get leisureStart => _leisureStart;
  dynamic get leisureEnd => _leisureEnd;
  bool get open24h => _open24h;
  bool get close => _close;

  Sunday({
      String openFrom,
      String openTill,
      dynamic leisureStart,
      dynamic leisureEnd,
      bool open24h,
      bool close}){
    _openFrom = openFrom;
    _openTill = openTill;
    _leisureStart = leisureStart;
    _leisureEnd = leisureEnd;
    _open24h = open24h;
    _close = close;
}

  Sunday.fromJson(dynamic json) {
    _openFrom = json["open_from"];
    _openTill = json["open_till"];
    _leisureStart = json["leisureStart"];
    _leisureEnd = json["leisureEnd"];
    _open24h = json["open_24h"];
    _close = json["close"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_from"] = _openFrom;
    map["open_till"] = _openTill;
    map["leisureStart"] = _leisureStart;
    map["leisureEnd"] = _leisureEnd;
    map["open_24h"] = _open24h;
    map["close"] = _close;
    return map;
  }

}

/// open_from : "09:00:00"
/// open_till : "17:00:00"
/// leisure_start : null
/// leisure_end : null
/// open_24h : true
/// close : false

class Saturday {
  String _openFrom;
  String _openTill;
  dynamic _leisureStart;
  dynamic _leisureEnd;
  bool _open24h;
  bool _close;

  String get openFrom => _openFrom;
  String get openTill => _openTill;
  dynamic get leisureStart => _leisureStart;
  dynamic get leisureEnd => _leisureEnd;
  bool get open24h => _open24h;
  bool get close => _close;

  Saturday({
      String openFrom,
      String openTill,
      dynamic leisureStart,
      dynamic leisureEnd,
      bool open24h,
      bool close}){
    _openFrom = openFrom;
    _openTill = openTill;
    _leisureStart = leisureStart;
    _leisureEnd = leisureEnd;
    _open24h = open24h;
    _close = close;
}

  Saturday.fromJson(dynamic json) {
    _openFrom = json["open_from"];
    _openTill = json["open_till"];
    _leisureStart = json["leisureStart"];
    _leisureEnd = json["leisureEnd"];
    _open24h = json["open_24h"];
    _close = json["close"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_from"] = _openFrom;
    map["open_till"] = _openTill;
    map["leisureStart"] = _leisureStart;
    map["leisureEnd"] = _leisureEnd;
    map["open_24h"] = _open24h;
    map["close"] = _close;
    return map;
  }

}

/// open_from : "09:00:00"
/// open_till : "17:00:00"
/// leisure_start : null
/// leisure_end : null
/// open_24h : true
/// close : false

class Friday {
  String _openFrom;
  String _openTill;
  dynamic _leisureStart;
  dynamic _leisureEnd;
  bool _open24h;
  bool _close;

  String get openFrom => _openFrom;
  String get openTill => _openTill;
  dynamic get leisureStart => _leisureStart;
  dynamic get leisureEnd => _leisureEnd;
  bool get open24h => _open24h;
  bool get close => _close;

  Friday({
      String openFrom,
      String openTill,
      dynamic leisureStart,
      dynamic leisureEnd,
      bool open24h,
      bool close}){
    _openFrom = openFrom;
    _openTill = openTill;
    _leisureStart = leisureStart;
    _leisureEnd = leisureEnd;
    _open24h = open24h;
    _close = close;
}

  Friday.fromJson(dynamic json) {
    _openFrom = json["open_from"];
    _openTill = json["open_till"];
    _leisureStart = json["leisureStart"];
    _leisureEnd = json["leisureEnd"];
    _open24h = json["open_24h"];
    _close = json["close"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_from"] = _openFrom;
    map["open_till"] = _openTill;
    map["leisureStart"] = _leisureStart;
    map["leisureEnd"] = _leisureEnd;
    map["open_24h"] = _open24h;
    map["close"] = _close;
    return map;
  }

}

/// open_from : "09:00:00"
/// open_till : "17:00:00"
/// leisure_start : null
/// leisure_end : null
/// open_24h : true
/// close : false

class Thursday {
  String _openFrom;
  String _openTill;
  dynamic _leisureStart;
  dynamic _leisureEnd;
  bool _open24h;
  bool _close;

  String get openFrom => _openFrom;
  String get openTill => _openTill;
  dynamic get leisureStart => _leisureStart;
  dynamic get leisureEnd => _leisureEnd;
  bool get open24h => _open24h;
  bool get close => _close;

  Thursday({
      String openFrom,
      String openTill,
      dynamic leisureStart,
      dynamic leisureEnd,
      bool open24h,
      bool close}){
    _openFrom = openFrom;
    _openTill = openTill;
    _leisureStart = leisureStart;
    _leisureEnd = leisureEnd;
    _open24h = open24h;
    _close = close;
}

  Thursday.fromJson(dynamic json) {
    _openFrom = json["open_from"];
    _openTill = json["open_till"];
    _leisureStart = json["leisureStart"];
    _leisureEnd = json["leisureEnd"];
    _open24h = json["open_24h"];
    _close = json["close"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_from"] = _openFrom;
    map["open_till"] = _openTill;
    map["leisureStart"] = _leisureStart;
    map["leisureEnd"] = _leisureEnd;
    map["open_24h"] = _open24h;
    map["close"] = _close;
    return map;
  }

}

/// open_from : "09:00:00"
/// open_till : "17:00:00"
/// leisure_start : null
/// leisure_end : null
/// open_24h : true
/// close : false

class Wednesday {
  String _openFrom;
  String _openTill;
  dynamic _leisureStart;
  dynamic _leisureEnd;
  bool _open24h;
  bool _close;

  String get openFrom => _openFrom;
  String get openTill => _openTill;
  dynamic get leisureStart => _leisureStart;
  dynamic get leisureEnd => _leisureEnd;
  bool get open24h => _open24h;
  bool get close => _close;

  Wednesday({
      String openFrom,
      String openTill,
      dynamic leisureStart,
      dynamic leisureEnd,
      bool open24h,
      bool close}){
    _openFrom = openFrom;
    _openTill = openTill;
    _leisureStart = leisureStart;
    _leisureEnd = leisureEnd;
    _open24h = open24h;
    _close = close;
}

  Wednesday.fromJson(dynamic json) {
    _openFrom = json["open_from"];
    _openTill = json["open_till"];
    _leisureStart = json["leisureStart"];
    _leisureEnd = json["leisureEnd"];
    _open24h = json["open_24h"];
    _close = json["close"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_from"] = _openFrom;
    map["open_till"] = _openTill;
    map["leisureStart"] = _leisureStart;
    map["leisureEnd"] = _leisureEnd;
    map["open_24h"] = _open24h;
    map["close"] = _close;
    return map;
  }

}

/// open_from : "09:00:00"
/// open_till : "17:00:00"
/// leisure_start : null
/// leisure_end : null
/// open_24h : true
/// close : false

class Tuesday {
  String _openFrom;
  String _openTill;
  dynamic _leisureStart;
  dynamic _leisureEnd;
  bool _open24h;
  bool _close;

  String get openFrom => _openFrom;
  String get openTill => _openTill;
  dynamic get leisureStart => _leisureStart;
  dynamic get leisureEnd => _leisureEnd;
  bool get open24h => _open24h;
  bool get close => _close;

  Tuesday({
      String openFrom,
      String openTill,
      dynamic leisureStart,
      dynamic leisureEnd,
      bool open24h,
      bool close}){
    _openFrom = openFrom;
    _openTill = openTill;
    _leisureStart = leisureStart;
    _leisureEnd = leisureEnd;
    _open24h = open24h;
    _close = close;
}

  Tuesday.fromJson(dynamic json) {
    _openFrom = json["open_from"];
    _openTill = json["open_till"];
    _leisureStart = json["leisureStart"];
    _leisureEnd = json["leisureEnd"];
    _open24h = json["open_24h"];
    _close = json["close"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_from"] = _openFrom;
    map["open_till"] = _openTill;
    map["leisureStart"] = _leisureStart;
    map["leisureEnd"] = _leisureEnd;
    map["open_24h"] = _open24h;
    map["close"] = _close;
    return map;
  }

}

/// open_from : "09:00:00"
/// open_till : "17:00:00"
/// leisure_start : null
/// leisure_end : null
/// open_24h : true
/// close : false

class Monday {
  String _openFrom;
  String _openTill;
  dynamic _leisureStart;
  dynamic _leisureEnd;
  bool _open24h;
  bool _close;

  String get openFrom => _openFrom;
  String get openTill => _openTill;
  dynamic get leisureStart => _leisureStart;
  dynamic get leisureEnd => _leisureEnd;
  bool get open24h => _open24h;
  bool get close => _close;

  Monday({
      String openFrom,
      String openTill,
      dynamic leisureStart,
      dynamic leisureEnd,
      bool open24h,
      bool close}){
    _openFrom = openFrom;
    _openTill = openTill;
    _leisureStart = leisureStart;
    _leisureEnd = leisureEnd;
    _open24h = open24h;
    _close = close;
}

  Monday.fromJson(dynamic json) {
    _openFrom = json["open_from"];
    _openTill = json["open_till"];
    _leisureStart = json["leisureStart"];
    _leisureEnd = json["leisureEnd"];
    _open24h = json["open_24h"];
    _close = json["close"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_from"] = _openFrom;
    map["open_till"] = _openTill;
    map["leisureStart"] = _leisureStart;
    map["leisureEnd"] = _leisureEnd;
    map["open_24h"] = _open24h;
    map["close"] = _close;
    return map;
  }

}

/// title : "Mrs."
/// name : "Islamia General Hospital"
/// designation : "General Hospital"
/// email : ""
/// mobile_no : ""
/// mobile_numbers : []
/// landline_no : ""
/// fax_no : ""
/// website : ""



class Contact {
  String _title;
  String _name;
  String _designation;
  String _email;
  String _mobileNo;
  List<MobileNumbers> _mobileNumbers;
  String _landlineNo;
  String _faxNo;
  String _website;

  String get title => _title;
  String get name => _name;
  String get designation => _designation;
  String get email => _email;
  String get mobileNo => _mobileNo;
  List<MobileNumbers> get mobileNumbers => _mobileNumbers;
  String get landlineNo => _landlineNo;
  String get faxNo => _faxNo;
  String get website => _website;

  Contact({
      String title,
      String name,
      String designation,
      String email,
      String mobileNo,
      List<MobileNumbers> mobileNumbers,
      String landlineNo,
      String faxNo,
      String website}){
    _title = title;
    _name = name;
    _designation = designation;
    _email = email;
    _mobileNo = mobileNo;
    _mobileNumbers = mobileNumbers;
    _landlineNo = landlineNo;
    _faxNo = faxNo;
    _website = website;
}

  Contact.fromJson(dynamic json) {
    _title = json["title"];
    _name = json["name"];
    _designation = json["designation"];
    _email = json["email"];
    _mobileNo = json["mobileNo"];
    if (json["mobile_numbers"] != null) {
      _mobileNumbers = [];
      json["mobile_numbers"].forEach((v) {
        _mobileNumbers.add(MobileNumbers.fromJson(v));
      });
    }
    _landlineNo = json["landlineNo"];
    _faxNo = json["faxNo"];
    _website = json["website"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["name"] = _name;
    map["designation"] = _designation;
    map["email"] = _email;
    map["mobileNo"] = _mobileNo;
    if (_mobileNumbers != null) {
      map["mobile_numbers"] = _mobileNumbers.map((v) => v.toJson()).toList();
    }
    map["landlineNo"] = _landlineNo;
    map["faxNo"] = _faxNo;
    map["website"] = _website;
    return map;
  }

}

/// geo : {"type":"Point","coordinates":[90.43081249999994,23.713062500000007]}
/// business_name : "Islamia General Hospital"
/// building : ""
/// street : "Dholpur Road"
/// land_mark : "25, North Jatrabari, Dholpur Road, Saydabad, Dhaka. (North Of Jatrabari Bridge)"
/// area : "saidabad"
/// postcode : "Dhaka-1100"
/// plus_code : "PC7J+68 Dhaka"
/// division : {"_id":"5bb608df41533c632889eb8c","name":"Dhaka"}
/// city : {"_id":"5bb608df41533c632889eb8d","name":"Dhaka"}
/// location : {"_id":"5bb608e041533c632889eba3","name":"Jatrabari"}


class MobileNumbers {
  bool verified;
  String mobileNumber;

  MobileNumbers({this.verified, this.mobileNumber});

  MobileNumbers.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verified'] = this.verified;
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}


class Llocation {
  Geo _geo;
  String _businessName;
  String _building;
  String _street;
  String _landMark;
  String _area;
  String _postcode;
  String _plusCode;
  Division _division;
  City _city;
  Location _location;

  Geo get geo => _geo;
  String get businessName => _businessName;
  String get building => _building;
  String get street => _street;
  String get landMark => _landMark;
  String get area => _area;
  String get postcode => _postcode;
  String get plusCode => _plusCode;
  Division get division => _division;
  City get city => _city;
  Location get location => _location;

  Llocation({
      Geo geo,
      String businessName,
      String building,
      String street,
      String landMark,
      String area,
      String postcode,
      String plusCode,
      Division division,
      City city,
      Location location}){
    _geo = geo;
    _businessName = businessName;
    _building = building;
    _street = street;
    _landMark = landMark;
    _area = area;
    _postcode = postcode;
    _plusCode = plusCode;
    _division = division;
    _city = city;
    _location = location;
}

  Llocation.fromJson(dynamic json) {
    _geo = json["geo"] != null ? Geo.fromJson(json["geo"]) : null;
    _businessName = json["business_name"];
    _building = json["building"];
    _street = json["street"];
    _landMark = json["land_mark"];
    _area = json["area"];
    _postcode = json["postcode"];
    _plusCode = json["plusCode"];
    _division = json["division"] != null ? Division.fromJson(json["division"]) : null;
    _city = json["city"] != null ? City.fromJson(json["city"]) : null;
    _location = json["location"] != null ? Location.fromJson(json["location"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_geo != null) {
      map["geo"] = _geo.toJson();
    }
    map["business_name"] = _businessName;
    map["building"] = _building;
    map["street"] = _street;
    map["land_mark"] = _landMark;
    map["area"] = _area;
    map["postcode"] = _postcode;
    map["plusCode"] = _plusCode;
    if (_division != null) {
      map["division"] = _division.toJson();
    }
    if (_city != null) {
      map["city"] = _city.toJson();
    }
    if (_location != null) {
      map["location"] = _location.toJson();
    }
    return map;
  }

}

/// _id : "5bb608e041533c632889eba3"
/// name : "Jatrabari"

class Location {
  String _id;
  String _name;

  String get id => _id;
  String get name => _name;

  Location({
      String id,
      String name}){
    _id = id;
    _name = name;
}

  Location.fromJson(dynamic json) {
    _id = json["Id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["name"] = _name;
    return map;
  }

}

/// _id : "5bb608df41533c632889eb8d"
/// name : "Dhaka"

class City {
  String _id;
  String _name;

  String get id => _id;
  String get name => _name;

  City({
      String id,
      String name}){
    _id = id;
    _name = name;
}

  City.fromJson(dynamic json) {
    _id = json["Id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["name"] = _name;
    return map;
  }

}

/// _id : "5bb608df41533c632889eb8c"
/// name : "Dhaka"

class Division {
  String _id;
  String _name;

  String get id => _id;
  String get name => _name;

  Division({
      String id,
      String name}){
    _id = id;
    _name = name;
}

  Division.fromJson(dynamic json) {
    _id = json["Id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Id"] = _id;
    map["name"] = _name;
    return map;
  }

}

/// type : "Point"
/// coordinates : [90.43081249999994,23.713062500000007]

class Geo {
  String _type;
  List<double> _coordinates;

  String get type => _type;
  List<double> get coordinates => _coordinates;

  Geo({
      String type,
      List<double> coordinates}){
    _type = type;
    _coordinates = coordinates;
}

  Geo.fromJson(dynamic json) {
    _type = json["type"];
    _coordinates = json["coordinates"] != null ? json["coordinates"].cast<double>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["coordinates"] = _coordinates;
    return map;
  }

}