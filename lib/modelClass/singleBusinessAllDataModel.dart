class SingleBusinessAllData {
  Llocation location;
  Contact contact;
  HoursOfOperation hoursOfOperation;
  List<ProfessionalAssociations> professionalAssociations;
  List<Certifications> certifications;
  List<Photos> photos;
  List<Null> suggestedPhotos;
  List<Videos> videos;
  List<AcceptedPaymentMethods> acceptedPaymentMethods;
  List<Keywords> keywords;
  List<dynamic> tags;
  Null reviewedAt;
  Null approvedAt;
  Null rejectedAt;
  Null modifiedAt;
  String modifiedByOwnerAt;
  Null deletedAt;
  Null deletedByOwnerAt;
  int status;
  int totalReviews;
  double aggregateRating;
  String sId;
  List<dynamic> sujjestedPhotos;
  String description;
  int yearOfEstablishment;
  String owner;
  String createdAt;
  String coverPhoto;
  String embedVideo;
  String logo;
  String slug;
  List<dynamic> faqs;
  List<Reviews> reviews;

  SingleBusinessAllData(
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
        this.sujjestedPhotos,
        this.description,
        this.yearOfEstablishment,
        this.owner,
        this.createdAt,
        this.coverPhoto,
        this.embedVideo,
        this.logo,
        this.slug,
        this.faqs,
        this.reviews});

  SingleBusinessAllData.fromJson(Map<String, dynamic> json) {
    location =
    json['location'] != null ? new Llocation.fromJson(json['location']) : null;
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    hoursOfOperation = json['hours_of_operation'] != null
        ? new HoursOfOperation.fromJson(json['hours_of_operation'])
        : null;
    if (json['professional_associations'] != null) {
      professionalAssociations = new List<ProfessionalAssociations>();
      json['professional_associations'].forEach((v) {
        professionalAssociations.add(new ProfessionalAssociations.fromJson(v));
      });
    }
    if (json['certifications'] != null) {
      certifications = new List<Certifications>();
      json['certifications'].forEach((v) {
        certifications.add(new Certifications.fromJson(v));
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
      videos = new List<Videos>();
      json['videos'].forEach((v) {
        videos.add(new Videos.fromJson(v));
      });
    }
    if (json['accepted_payment_methods'] != null) {
      acceptedPaymentMethods = new List<AcceptedPaymentMethods>();
      json['accepted_payment_methods'].forEach((v) {
        acceptedPaymentMethods.add( AcceptedPaymentMethods.fromJson(v));
      });
    }
    if (json['keywords'] != null) {
      keywords = new List<Keywords>();
      json['keywords'].forEach((v) {
        keywords.add(Keywords.fromJson(v));
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
    if (json['sujjested_photos'] != null) {
      sujjestedPhotos = new List<Null>();
      json['sujjested_photos'].forEach((v) {
        sujjestedPhotos.add(v);
      });
    }
    description = json['description'];
    yearOfEstablishment = json['year_of_establishment'];
    owner = json['owner'];
    createdAt = json['created_at'];
    coverPhoto = json['cover_photo'];
    embedVideo = json['embed_video'];
    logo = json['logo'];
    slug = json['slug'];
    if (json['faqs'] != null) {
      faqs = new List<Null>();
      json['faqs'].forEach((v) {
        faqs.add(v);
      });
    }
    if (json['reviews'] != null) {
      reviews = new List<Reviews>();
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
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
          this.professionalAssociations.map((v) => v.toJson()).toList();
    }
    if (this.certifications != null) {
      data['certifications'] =
          this.certifications.map((v) => v.toJson()).toList();
    }
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    if (this.suggestedPhotos != null) {
      data['suggested_photos'] =
          this.suggestedPhotos.map((v) => v).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
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
    if (this.sujjestedPhotos != null) {
      data['sujjested_photos'] =
          this.sujjestedPhotos.map((v) => v).toList();
    }
    data['description'] = this.description;
    data['year_of_establishment'] = this.yearOfEstablishment;
    data['owner'] = this.owner;
    data['created_at'] = this.createdAt;
    data['cover_photo'] = this.coverPhoto;
    data['embed_video'] = this.embedVideo;
    data['logo'] = this.logo;
    data['slug'] = this.slug;
    if (this.faqs != null) {
      data['faqs'] = this.faqs.map((v) => v).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  Geo geo;
  String building;
  String businessName;
  String landMark;
  Division division;
  City city;
  City location;

  Location(
      {this.geo,
        this.building,
        this.businessName,
        this.landMark,
        this.division,
        this.city,
        this.location});

  Location.fromJson(Map<String, dynamic> json) {
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    building = json['building'];
    businessName = json['business_name'];
    landMark = json['land_mark'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    location =
    json['location'] != null ? new City.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geo != null) {
      data['geo'] = this.geo.toJson();
    }
    data['building'] = this.building;
    data['business_name'] = this.businessName;
    data['land_mark'] = this.landMark;
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
  String id;
  String name;

  Division({this.id, this.name});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class City {
  String sId;
  String name;

  City({this.sId, this.name});

  City.fromJson(Map<String, dynamic> json) {
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
  String designation;
  String faxNo;
  String landlineNo;
  List<MobileNumbers> mobileNumbers;
  String name;
  String title;
  String website;

  Contact(
      {this.designation,
        this.faxNo,
        this.landlineNo,
        this.mobileNumbers,
        this.name,
        this.title,
        this.website});

  Contact.fromJson(Map<String, dynamic> json) {
    designation = json['designation'];
    faxNo = json['fax_no'];
    landlineNo = json['landline_no'];
    if (json['mobile_numbers'] != null) {
      mobileNumbers = new List<MobileNumbers>();
      json['mobile_numbers'].forEach((v) {
        mobileNumbers.add(new MobileNumbers.fromJson(v));
      });
    }
    name = json['name'];
    title = json['title'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['designation'] = this.designation;
    data['fax_no'] = this.faxNo;
    data['landline_no'] = this.landlineNo;
    if (this.mobileNumbers != null) {
      data['mobile_numbers'] =
          this.mobileNumbers.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['title'] = this.title;
    data['website'] = this.website;
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
  Null leisureStart;
  Null leisureEnd;
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

class Photos {
  Null approvedAt;
  String sId;
  String image;
  String addedAt;
  int v;

  Photos({this.approvedAt, this.sId, this.image, this.addedAt, this.v});

  Photos.fromJson(Map<String, dynamic> json) {
    approvedAt = json['approved_at'];
    sId = json['_id'];
    image = json['image'];
    addedAt = json['added_at'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approved_at'] = this.approvedAt;
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['added_at'] = this.addedAt;
    data['v'] = this.v;
    return data;
  }
}

class Videos {
  String sId;
  String video;
  int v;

  Videos({this.sId, this.video, this.v});

  Videos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    video = json['video'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['video'] = this.video;
    data['v'] = this.v;
    return data;
  }
}

class Reviews {
  String comment;
  String sId;
  String addedById;
  String addedBy;
  var rating;
  String businessId;
  String reviewedAt;
  int v;

  Reviews(
      {this.comment,
        this.sId,
        this.addedById,
        this.addedBy,
        this.rating,
        this.businessId,
        this.reviewedAt,
        this.v});

  Reviews.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    sId = json['_id'];
    addedById = json['added_by_id'];
    addedBy = json['added_by'];
    rating = json['rating'];
    businessId = json['business_id'];
    reviewedAt = json['reviewed_at'];
    v = json['v'];
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
    data['v'] = this.v;
    return data;
  }
}

class AcceptedPaymentMethods {
  String sId;
  String name;

  AcceptedPaymentMethods({this.sId, this.name});

  AcceptedPaymentMethods.fromJson(Map<String, dynamic> json) {
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

class ProfessionalAssociations {
  String sId;
  String name;

  ProfessionalAssociations({this.sId, this.name});

  ProfessionalAssociations.fromJson(Map<String, dynamic> json) {
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

class Certifications {
  String sId;
  String name;

  Certifications({this.sId, this.name});

  Certifications.fromJson(Map<String, dynamic> json) {
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

class Keywords {
  String sId;
  String name;

  Keywords({this.sId, this.name});

  Keywords.fromJson(Map<String, dynamic> json) {
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

