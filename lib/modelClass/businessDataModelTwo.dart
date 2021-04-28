class BusinessDataModel {
  Division location;
  Contact contact;
  HoursOfOperation hoursOfOperation;
  List<Null> professionalAssociations;
  List<Null> certifications;
  List<Photos> photos;
  List<Null> suggestedPhotos;
  List<Null> videos;
  List<Accepted_payment_methods> acceptedPaymentMethods;
  List<Keywords> keywords;
  List<Null> tags;
  String reviewedAt;
  Null approvedAt;
  Null rejectedAt;
  String modifiedAt;
  Null modifiedByOwnerAt;
  Null deletedAt;
  Null deletedByOwnerAt;
  int status;
  int totalReviews;
  int aggregateRating;
  String sId;
  String description;
  Null yearOfEstablishment;
  Null annualTurnover;
  Null noOfEmployees;
  String logo;
  String coverPhoto;
  Null embedVideo;
  String createdAt;
  String addedId;
  EditBy editBy;
  EditBy reviewedBy;
  Null approvedBy;
  Null rejectedBy;
  List<Null> faqs;
  List<Null> reviews;

  BusinessDataModel(
      {this.location,
        this.contact,
        this.hoursOfOperation,
        this.professionalAssociations,
        this.certifications,
        this.photos,
        this.suggestedPhotos,
        this.videos,
        this.acceptedPaymentMethods,
        this.keywords,
        this.tags,
        this.reviewedAt,
        this.approvedAt,
        this.rejectedAt,
        this.modifiedAt,
        this.modifiedByOwnerAt,
        this.deletedAt,
        this.deletedByOwnerAt,
        this.status,
        this.totalReviews,
        this.aggregateRating,
        this.sId,
        this.description,
        this.yearOfEstablishment,
        this.annualTurnover,
        this.noOfEmployees,
        this.logo,
        this.coverPhoto,
        this.embedVideo,
        this.createdAt,
        this.addedId,
        this.editBy,
        this.reviewedBy,
        this.approvedBy,
        this.rejectedBy,
        this.faqs,
        this.reviews});

  BusinessDataModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Division.fromJson(json['location'])
        : null;
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    hoursOfOperation = json['hours_of_operation'] != null
        ? new HoursOfOperation.fromJson(json['hours_of_operation'])
        : null;
    if (json['professional_associations'] != null) {
      professionalAssociations = new List<Null>();
      json['professional_associations'].forEach((v) {
        professionalAssociations.add(v);
      });
    }
    if (json['certifications'] != null) {
      certifications = new List<Null>();
      json['certifications'].forEach((v) {
        certifications.add(v);
      });
    }
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    if (json['suggested_photos'] != null) {
      suggestedPhotos = new List<Null>();
      json['suggested_photos'].forEach((v) {
        suggestedPhotos.add(v);
      });
    }
    if (json['videos'] != null) {
      videos = new List<Null>();
      json['videos'].forEach((v) {
        videos.add(v);
      });
    }
    if (json['accepted_payment_methods'] != null) {
      acceptedPaymentMethods = new List<Accepted_payment_methods>();
      json['accepted_payment_methods'].forEach((v) {
        acceptedPaymentMethods.add(v);
      });
    }
    if (json['keywords'] != null) {
      keywords = new List<Keywords>();
      json['keywords'].forEach((v) {
        keywords.add(v);
      });
    }
    if (json['tags'] != null) {
      tags = new List<Null>();
      json['tags'].forEach((v) {
        tags.add(v);
      });
    }
    reviewedAt = json['reviewed_at'];
    approvedAt = json['approved_at'];
    rejectedAt = json['rejected_at'];
    modifiedAt = json['modified_at'];
    modifiedByOwnerAt = json['modified_by_owner_at'];
    deletedAt = json['deleted_at'];
    deletedByOwnerAt = json['deleted_by_owner_at'];
    status = json['status'];
    totalReviews = json['total_reviews'];
    aggregateRating = json['aggregate_rating'];
    sId = json['_id'];
    description = json['description'];
    yearOfEstablishment = json['year_of_establishment'];
    annualTurnover = json['annual_turnover'];
    noOfEmployees = json['no_of_employees'];
    logo = json['logo'];
    coverPhoto = json['cover_photo'];
    embedVideo = json['embed_video'];
    createdAt = json['created_at'];
    addedId = json['added_id'];
    editBy =
    json['edit_by'] != null ? new EditBy.fromJson(json['edit_by']) : null;
    reviewedBy = json['reviewed_by'] != null
        ? new EditBy.fromJson(json['reviewed_by'])
        : null;
    approvedBy = json['approved_by'];
    rejectedBy = json['rejected_by'];
    if (json['faqs'] != null) {
      faqs = new List<Null>();
      json['faqs'].forEach((v) {
        faqs.add(v);
      });
    }
    if (json['reviews'] != null) {
      reviews = new List<Null>();
      json['reviews'].forEach((v) {
        reviews.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    if (this.hoursOfOperation != null) {
      data['hours_of_operation'] = this.hoursOfOperation.toJson();
    }
    if (this.professionalAssociations != null) {
      data['professional_associations'] =
          this.professionalAssociations.map((v) => v).toList();
    }
    if (this.certifications != null) {
      data['certifications'] =
          this.certifications.map((v) => v).toList();
    }
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    if (this.suggestedPhotos != null) {
      data['suggested_photos'] =
          this.suggestedPhotos.map((v) => v).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v).toList();
    }
    if (this.acceptedPaymentMethods != null) {
      data['accepted_payment_methods'] =
          this.acceptedPaymentMethods.map((v) => v.toJson()).toList();
    }
    if (this.keywords != null) {
      data['keywords'] = this.keywords.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v).toList();
    }
    data['reviewed_at'] = this.reviewedAt;
    data['approved_at'] = this.approvedAt;
    data['rejected_at'] = this.rejectedAt;
    data['modified_at'] = this.modifiedAt;
    data['modified_by_owner_at'] = this.modifiedByOwnerAt;
    data['deleted_at'] = this.deletedAt;
    data['deleted_by_owner_at'] = this.deletedByOwnerAt;
    data['status'] = this.status;
    data['total_reviews'] = this.totalReviews;
    data['aggregate_rating'] = this.aggregateRating;
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['year_of_establishment'] = this.yearOfEstablishment;
    data['annual_turnover'] = this.annualTurnover;
    data['no_of_employees'] = this.noOfEmployees;
    data['logo'] = this.logo;
    data['cover_photo'] = this.coverPhoto;
    data['embed_video'] = this.embedVideo;
    data['created_at'] = this.createdAt;
    data['added_id'] = this.addedId;
    if (this.editBy != null) {
      data['edit_by'] = this.editBy.toJson();
    }
    if (this.reviewedBy != null) {
      data['reviewed_by'] = this.reviewedBy.toJson();
    }
    data['approved_by'] = this.approvedBy;
    data['rejected_by'] = this.rejectedBy;
    if (this.faqs != null) {
      data['faqs'] = this.faqs.map((v) => v).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v).toList();
    }
    return data;
  }
}

class Location {
  Geo geo;
  String businessName;
  Null building;
  String street;
  String landMark;
  String area;
  String postcode;
  Null plusCode;
  Division division;
  Division city;
  Division location;

  Location(
      {this.geo,
        this.businessName,
        this.building,
        this.street,
        this.landMark,
        this.area,
        this.postcode,
        this.plusCode,
        this.division,
        this.city,
        this.location});

  Location.fromJson(Map<String, dynamic> json) {
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    businessName = json['business_name'];
    building = json['building'];
    street = json['street'];
    landMark = json['land_mark'];
    area = json['area'];
    postcode = json['postcode'];
    plusCode = json['plus_code'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    city = json['city'] != null ? new Division.fromJson(json['city']) : null;
    location = json['location'] != null
        ? new Division.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    data['business_name'] = this.businessName;
    data['building'] = this.building;
    data['street'] = this.street;
    data['land_mark'] = this.landMark;
    data['area'] = this.area;
    data['postcode'] = this.postcode;
    data['plus_code'] = this.plusCode;
    if (this.division != null) {
      data['division'] = this.division.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
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

class Division {
  String sId;
  String name;

  Division({this.sId, this.name});

  Division.fromJson(Map<String, dynamic> json) {
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

class Contact {
  String title;
  String name;
  String designation;
  Null email;
  Null mobileNo;
  List<MobileNumbers> mobileNumbers;
  Null landlineNo;
  Null faxNo;
  Null website;
  Null socialLink;

  Contact(
      {this.title,
        this.name,
        this.designation,
        this.email,
        this.mobileNo,
        this.mobileNumbers,
        this.landlineNo,
        this.faxNo,
        this.website,
        this.socialLink});

  Contact.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    name = json['name'];
    designation = json['designation'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    if (json['mobile_numbers'] != null) {
      mobileNumbers = new List<MobileNumbers>();
      json['mobile_numbers'].forEach((v) {
        mobileNumbers.add(new MobileNumbers.fromJson(v));
      });
    }
    landlineNo = json['landline_no'];
    faxNo = json['fax_no'];
    website = json['website'];
    socialLink = json['social_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    if (this.mobileNumbers != null) {
      data['mobile_numbers'] =
          this.mobileNumbers.map((v) => v.toJson()).toList();
    }
    data['landline_no'] = this.landlineNo;
    data['fax_no'] = this.faxNo;
    data['website'] = this.website;
    data['social_link'] = this.socialLink;
    return data;
  }
}

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

class HoursOfOperation {
  Monday monday;
  Monday tuesday;
  Monday wednesday;
  Monday thursday;
  Monday friday;
  Monday saturday;
  Monday sunday;
  bool displayHoursOfOperation;

  HoursOfOperation(
      {this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday,
        this.saturday,
        this.sunday,
        this.displayHoursOfOperation});

  HoursOfOperation.fromJson(Map<String, dynamic> json) {
    monday =
    json['monday'] != null ? new Monday.fromJson(json['monday']) : null;
    tuesday =
    json['tuesday'] != null ? new Monday.fromJson(json['tuesday']) : null;
    wednesday = json['wednesday'] != null
        ? new Monday.fromJson(json['wednesday'])
        : null;
    thursday =
    json['thursday'] != null ? new Monday.fromJson(json['thursday']) : null;
    friday =
    json['friday'] != null ? new Monday.fromJson(json['friday']) : null;
    saturday =
    json['saturday'] != null ? new Monday.fromJson(json['saturday']) : null;
    sunday =
    json['sunday'] != null ? new Monday.fromJson(json['sunday']) : null;
    displayHoursOfOperation = json['display_hours_of_operation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.monday != null) {
      data['monday'] = this.monday.toJson();
    }
    if (this.tuesday != null) {
      data['tuesday'] = this.tuesday.toJson();
    }
    if (this.wednesday != null) {
      data['wednesday'] = this.wednesday.toJson();
    }
    if (this.thursday != null) {
      data['thursday'] = this.thursday.toJson();
    }
    if (this.friday != null) {
      data['friday'] = this.friday.toJson();
    }
    if (this.saturday != null) {
      data['saturday'] = this.saturday.toJson();
    }
    if (this.sunday != null) {
      data['sunday'] = this.sunday.toJson();
    }
    data['display_hours_of_operation'] = this.displayHoursOfOperation;
    return data;
  }
}

class Monday {
  String openFrom;
  String openTill;
  String leisureStart;
  String leisureEnd;
  bool open24h;
  bool close;

  Monday(
      {this.openFrom,
        this.openTill,
        this.leisureStart,
        this.leisureEnd,
        this.open24h,
        this.close});

  Monday.fromJson(Map<String, dynamic> json) {
    openFrom = json['open_from'];
    openTill = json['open_till'];
    leisureStart = json['leisure_start'];
    leisureEnd = json['leisure_end'];
    open24h = json['open_24h'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open_from'] = this.openFrom;
    data['open_till'] = this.openTill;
    data['leisure_start'] = this.leisureStart;
    data['leisure_end'] = this.leisureEnd;
    data['open_24h'] = this.open24h;
    data['close'] = this.close;
    return data;
  }
}

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

class Photos {
  Null approvedAt;
  String sId;
  String image;
  String addedAt;

  Photos({this.approvedAt, this.sId, this.image, this.addedAt});

  Photos.fromJson(Map<String, dynamic> json) {
    approvedAt = json['approved_at'];
    sId = json['_id'];
    image = json['image'];
    addedAt = json['added_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approved_at'] = this.approvedAt;
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['added_at'] = this.addedAt;
    return data;
  }
}

class EditBy {
  String sId;
  String username;

  EditBy({this.sId, this.username});

  EditBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    return data;
  }
}