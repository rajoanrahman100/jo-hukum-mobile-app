class ResponseBusinessData {
  Location location;
  HoursOfOperation hoursOfOperation;
  List<String> professionalAssociations;
  List<String> certifications;
  List<dynamic> photos;
  List<dynamic> suggestedPhotos;
  List<dynamic> videos;
  List<dynamic> acceptedPaymentMethods;
  List<String> keywords;
  List<String> tags;
  dynamic reviewedAt;
  dynamic approvedAt;
  dynamic rejectedAt;
  dynamic modifiedAt;
  dynamic modifiedByOwnerAt;
  dynamic deletedAt;
  dynamic deletedByOwnerAt;
  int status;
  int totalReviews;
  int aggregateRating;
  String id;
  Contact contact;
  String description;
  String businessType;
  List<Faqs> faqs;
  int yearOfEstablishment;
  String metaTitle;
  String metaDescription;
  String owner;
  String createdAt;
  String slug;
  int v;

  ResponseBusinessData(
      {this.location,
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
        this.id,
        this.contact,
        this.description,
        this.businessType,
        this.faqs,
        this.yearOfEstablishment,
        this.metaTitle,
        this.metaDescription,
        this.owner,
        this.createdAt,
        this.slug,
        this.v});

  ResponseBusinessData.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    hoursOfOperation = json['hours_of_operation'] != null
        ? new HoursOfOperation.fromJson(json['hours_of_operation'])
        : null;
    professionalAssociations = json['professional_associations'].cast<String>();
    certifications = json['certifications'].cast<String>();
    if (json['photos'] != null) {
      photos = new List<Null>();
      json['photos'].forEach((v) {
        photos.add(v);
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
    acceptedPaymentMethods = json['accepted_payment_methods'].cast<String>();
    keywords = json['keywords'].cast<String>();
    tags = json['tags'].cast<String>();
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
    id = json['_id'];
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    description = json['description'];
    businessType = json['business_type'];
    if (json['faqs'] != null) {
      faqs = new List<Faqs>();
      json['faqs'].forEach((v) {
        faqs.add(new Faqs.fromJson(v));
      });
    }
    yearOfEstablishment = json['year_of_establishment'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    owner = json['owner'];
    createdAt = json['created_at'];
    slug = json['slug'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.hoursOfOperation != null) {
      data['hours_of_operation'] = this.hoursOfOperation.toJson();
    }
    data['professional_associations'] = this.professionalAssociations;
    data['certifications'] = this.certifications;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v).toList();
    }
    if (this.suggestedPhotos != null) {
      data['suggested_photos'] =
          this.suggestedPhotos.map((v) => v).toList();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v).toList();
    }
    data['accepted_payment_methods'] = this.acceptedPaymentMethods;
    data['keywords'] = this.keywords;
    data['tags'] = this.tags;
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
    data['_id'] = this.id;
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    data['description'] = this.description;
    data['business_type'] = this.businessType;
    if (this.faqs != null) {
      data['faqs'] = this.faqs.map((v) => v.toJson()).toList();
    }
    data['year_of_establishment'] = this.yearOfEstablishment;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['owner'] = this.owner;
    data['created_at'] = this.createdAt;
    data['slug'] = this.slug;
    data['v'] = this.v;
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

class Faqs {
  String question;
  String answer;

  Faqs({this.question, this.answer});

  Faqs.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}